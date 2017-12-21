//
//  TestimonyDetailsVC.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import CoreData

class TestimonyDetailsVC: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var testimonyTitleTextField: UITextField!
    @IBOutlet weak var testimonyDetailsTextField: UITextField!
    @IBOutlet weak var testimonyAssigneeMemberImage: UIImageView!
    @IBOutlet weak var testimonyAssigneeLabel: UILabel!
    @IBOutlet weak var testimonyAssigneeText: UITextField!
    
    let memberPicker = UIPickerView()
    
    let testimony = taskTestimony
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        memberPicker.delegate = self
        memberPicker.dataSource = self
        memberPicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.donePressedOnKeyboard))
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        
        testimonyAssigneeText.inputView = memberPicker
        testimonyAssigneeText.inputAccessoryView = toolBar
        
        testimonyDetailsTextField.delegate = self
        testimonyDetailsTextField.attributedPlaceholder = NSAttributedString(string: "Enter Details...", attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.7233663201, green: 0.7233663201, blue: 0.7233663201, alpha: 1)])
        
        self.clickSoundURL()
        
        self.hideKeyboardWhenTappedAround()
        
        getTaskTestimony()
        getTestimonys()
        getMembersForPicker()
        loadTestimonyData()
        loadTestimonyAssignmentImage()
        
        if testimony.selectedTestimony != nil {
            loadTestimonyData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        getTaskTestimony()
        getTestimonys()
        getMembersForPicker()
        loadTestimonyData()
        loadTestimonyAssignmentImage()
    }
    
    // MARK: - Picker View Set up
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let assignee = membersPickerArray[row]
        return assignee.name
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return membersPickerArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let assignee = membersPickerArray[row]
        let testimony = taskTestimoniesArray[0]
        testimonyAssigneeMemberImage.image = assignee.photo as? UIImage
        testimonyAssigneeLabel.text = assignee.name
        testimony.assignment = assignee
        if assignee.name == "Auto-Assign" {
            testimony.assigned = false
        } else {
            testimony.assigned = true
        }
        ad.saveContext()
    }
    
    // MARK: - Text Field Options
    
    // Hide the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func donePressedOnKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        playClick()
        
        let testimonyToSave = testimony.selectedTestimony
        
        if let title = testimonyTitleTextField.text {
            testimonyToSave?.title = title
        }
        
        if let details = testimonyDetailsTextField.text {
            testimonyToSave?.detail = details
        }
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    func loadTestimonyData() {
        if let testimonyToEdit = testimony.selectedTestimony {
            testimonyTitleTextField.text = testimonyToEdit.title
            testimonyDetailsTextField.text = testimonyToEdit.detail
        }
    }
    
    func loadTestimonyAssignmentImage() {
        let assignee = testimony.assignment
        if assignee != nil {
            testimonyAssigneeMemberImage.image = assignee?.photo as? UIImage
            testimonyAssigneeLabel.text = assignee?.name
        } else {
            testimonyAssigneeMemberImage.image = #imageLiteral(resourceName: "Missing Profile")
            testimonyAssigneeLabel.text = "Auto-Assign"
        }
    }
}

