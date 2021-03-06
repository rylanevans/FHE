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
    @IBOutlet weak var testimonyDetailsTextField: UITextView!
    @IBOutlet weak var testimonyAssigneeMemberImage: UIImageView!
    @IBOutlet weak var testimonyAssigneeLabel: UILabel!
    @IBOutlet weak var testimonyAssigneeText: UITextField!
    @IBOutlet weak var saveButton: BounceButton!
    @IBOutlet weak var hideSaveButton: UIImageView!
    
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
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.donePressedOnKeyboard))
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        
        testimonyAssigneeText.inputView = memberPicker
        testimonyAssigneeText.inputAccessoryView = toolBar
        testimonyTitleTextField.inputAccessoryView = toolBar
        testimonyDetailsTextField.inputAccessoryView = toolBar
        
        self.clickSoundURL()
        
        self.hideKeyboardWhenTappedAround()
        
        getAllTasks()
        getMembersForPicker()
        loadTestimonyData()
        loadTestimonyAssignmentImage()
        
        if testimony.selectedTestimony != nil {
            loadTestimonyData()
            checkValidTitle()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        getAllTasks()
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
        let testimony = taskTestimony
        testimonyAssigneeMemberImage.image = assignee.photo as? UIImage
        testimonyAssigneeLabel.text = assignee.name
        if assignee.name == "Auto-Assign" {
            testimony.assigned = false
        } else {
            testimony.assigned = true
            testimony.assignment = assignee
        }
        runAssignments()
        ad.saveContext()
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkValidTitle()
        return
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
    
    func checkValidTitle() {
        let text = testimonyTitleTextField.text
        if text?.isEmpty == false {
            hideSaveButton.isHidden = true
            saveButton.isEnabled = true
        } else {
            hideSaveButton.isHidden = false
            saveButton.isEnabled = false
            
            let alertController = UIAlertController(title: "⚠ WARNING!", message: "In order to enable save option, you need a “Title”.", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "✓ OK", style: .default, handler: {
                (action : UIAlertAction!) -> Void in
            })
            
            alertController.addAction(okAction)
            alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    @objc func donePressedOnKeyboard() {
        checkValidTitle()
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
        let assigned = testimony.assigned
        let assignee = testimony.assignment
        
        if assigned == true {
            testimonyAssigneeMemberImage.image = assignee?.photo as? UIImage
            testimonyAssigneeLabel.text = assignee?.name
        } else {
            testimonyAssigneeMemberImage.image = #imageLiteral(resourceName: "Missing Profile")
            testimonyAssigneeLabel.text = "Auto-Assign"
        }
    }
}

