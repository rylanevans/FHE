//
//  ThoughtDetailsVC.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import CoreData

class ThoughtDetailsVC: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var thoughtTitleTextField: UITextField!
    @IBOutlet weak var thoughtDetailsTextField: UITextView!
    @IBOutlet weak var thoughtAssigneeMemberImage: UIImageView!
    @IBOutlet weak var thoughtAssigneeLabel: UILabel!
    @IBOutlet weak var thoughtAssigneeText: UITextField!
    
    let memberPicker = UIPickerView()
    
    let thought = taskThought
    
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
        
        thoughtAssigneeText.inputView = memberPicker
        thoughtAssigneeText.inputAccessoryView = toolBar
        thoughtTitleTextField.inputAccessoryView = toolBar
        thoughtDetailsTextField.inputAccessoryView = toolBar
        
        self.clickSoundURL()
        
        self.hideKeyboardWhenTappedAround()
        
        getAllTasks()
        getMembersForPicker()
        loadThoughtData()
        loadThoughtAssignmentImage()
        
        if thought.selectedThought != nil {
            loadThoughtData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        getAllTasks()
        getMembersForPicker()
        loadThoughtData()
        loadThoughtAssignmentImage()
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
        let thought = taskThought
        thoughtAssigneeMemberImage.image = assignee.photo as? UIImage
        thoughtAssigneeLabel.text = assignee.name
        thought.assignment = assignee
        if assignee.name == "Auto-Assign" {
            thought.assigned = false
        } else {
            thought.assigned = true
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
        
        let thoughtToSave = thought.selectedThought
        
        if let title = thoughtTitleTextField.text {
            thoughtToSave?.title = title
        }
        
        if let details = thoughtDetailsTextField.text {
            thoughtToSave?.detail = details
        }
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    func loadThoughtData() {
        if let thoughtToEdit = thought.selectedThought {
            thoughtTitleTextField.text = thoughtToEdit.title
            thoughtDetailsTextField.text = thoughtToEdit.detail
        }
    }
    
    func loadThoughtAssignmentImage() {
        let assignee = thought.assignment
        if assignee != nil {
            thoughtAssigneeMemberImage.image = assignee?.photo as? UIImage
            thoughtAssigneeLabel.text = assignee?.name
        } else {
            thoughtAssigneeMemberImage.image = #imageLiteral(resourceName: "Missing Profile")
            thoughtAssigneeLabel.text = "Auto-Assign"
        }
    }
}

