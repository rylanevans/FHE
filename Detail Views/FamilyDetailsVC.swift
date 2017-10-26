//
//  FamilyDetailsVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/20/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

class FamilyDetailsVC: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var saveButton: BounceButton!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    @IBOutlet weak var hideSaveButton: UIImageView!
    @IBOutlet weak var photoMemberImage: UIImageView!
    @IBOutlet weak var memberNameText: UITextField!
    @IBOutlet weak var memberAgeText: UITextField!
    @IBOutlet weak var attendingSwitch: UISwitch!
    
    var memberToEdit: Member?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.clickSoundURL()
        
        self.hideKeyboardWhenTappedAround()
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.donePressedOnKeyboard))
        
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        
        memberAgeText.delegate = self
        memberNameText.delegate = self
        memberAgeText.attributedPlaceholder = NSAttributedString(string: "40", attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)])
        memberNameText.attributedPlaceholder = NSAttributedString(string: "Dad", attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)])
        memberAgeText.inputAccessoryView = toolBar
        memberNameText.inputAccessoryView = toolBar
        
        checkValidMemberName()
        
        if memberToEdit != nil {
            loadMemberData()
        }
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkValidMemberName()
        switch (textField.tag) {
        case 1:
            navigationItem.title = textField.text
            break;
        default:
            return
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.isEnabled = false
    }
    
    func checkValidMemberName() {
        // Disable the Save button if the text field is empty.
        let text = memberNameText.text ?? ""
        saveButton.isEnabled = !text.isEmpty
        if text.isEmpty != true {
            hideSaveButton.isHidden = true
        }
    }
    
    @objc func donePressedOnKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // The info dictionary contains multiple representations of the image, and this uses the original.
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            // Set photoImageView to display the selected image.
            photoMemberImage.image = selectedImage
        }
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Navigation
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddMemberMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMemberMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController!.popViewController(animated: true)
        }
    }
    
    // MARK: SelectFromPhotoLibrary
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        playClick()
        
        // Hide the keyboard.
        memberNameText.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        playClick()
        
        let member: Member!
        
        if memberToEdit == nil {
            member = Member(context: context)
        } else {
            member = memberToEdit
        }
        
        if let photo = photoMemberImage.image {
            member.photo = photo
        }
        
        if let name = memberNameText.text {
            member.name = name
        }
        
        if let age = Int64(memberAgeText.text!) {
            member.age = age
        }
        
        if attendingSwitch.isOn {
            member.attending = true
        } else {
            member.attending = false
        }
        
        ad.saveContext()
    }
    
    func loadMemberData() {
        if let member = memberToEdit {
            photoMemberImage.image = member.photo as? UIImage
            memberNameText.text = member.name
            memberAgeText.text = "\(member.age)"
            attendingSwitch.isOn = member.attending
            textFieldDidEndEditing(memberNameText)
        }
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        if memberToEdit != nil {
            context.delete(memberToEdit!)
            ad.saveContext()
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
}

