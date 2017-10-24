//
//  FamilyDetailsVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/20/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

class FamilyDetailsVC: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var photoMemberImageView: UIImageView!
    @IBOutlet weak var memberNameText: UITextField!
    @IBOutlet weak var memberAgeText: UITextField!
    @IBOutlet weak var attendingMemberSwithTapped: UISwitch!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
//    var newMember: Member
    
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
        memberAgeText.attributedPlaceholder = NSAttributedString(string: "40", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        memberNameText.attributedPlaceholder = NSAttributedString(string: "Dad", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        memberAgeText.inputAccessoryView = toolBar
        memberNameText.inputAccessoryView = toolBar
        
        checkValidMemberName()
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
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set photoImageView to display the selected image.
        photoMemberImageView.image = selectedImage
        
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
    
    // This method lets you configure a view controller before it's presented.
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if saveButton == sender {
    //            let name = nameTextField.text ?? ""
    //            let photo = photoImageView.image
    //            let rating = ratingControl.rating
    //
    //            // Set the new member to be passed to MemberListTableViewController after the unwind segue.
    //            newMember = Member()
    //        }
    //    }
    
    // MARK: Actions
    
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
    
    @IBAction func saveMemberButtonPressed(_ sender: Any) {
//        var member: Member!
//        
//        let newPicture = Member(context: context)
//        newPicture.photo = photoMemberImageView.image
//        
//        member.photo = newPicture
    }
}

