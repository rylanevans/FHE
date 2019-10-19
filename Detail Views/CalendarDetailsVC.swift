//
//  CalendarDetailsVC.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import CoreData

class CalendarDetailsVC: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var calendarTitleTextField: UITextField!
    @IBOutlet weak var calendarDetailsTextField: UITextView!
    @IBOutlet weak var calendarAssigneeMemberImage: UIImageView!
    @IBOutlet weak var calendarAssigneeLabel: UILabel!
    @IBOutlet weak var calendarAssigneeText: UITextField!
    @IBOutlet weak var saveButton: BounceButton!
    @IBOutlet weak var hideSaveButton: UIImageView!
    
    let memberPicker = UIPickerView()
    
    let calendar = taskCalendar
    
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
        
        calendarAssigneeText.inputView = memberPicker
        calendarAssigneeText.inputAccessoryView = toolBar
        calendarTitleTextField.inputAccessoryView = toolBar
        calendarDetailsTextField.inputAccessoryView = toolBar
        
        self.clickSoundURL()
        
        self.hideKeyboardWhenTappedAround()
        
        getAllTasks()
        getMembersForPicker()
        loadCalendarData()
        loadCalendarAssignmentImage()
        
        if calendar.selectedCalendar != nil {
            loadCalendarData()
        }
        checkValidTitle()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        getAllTasks()
        getMembersForPicker()
        loadCalendarData()
        loadCalendarAssignmentImage()
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
        let calendar = taskCalendar
        calendarAssigneeMemberImage.image = assignee.photo as? UIImage
        calendarAssigneeLabel.text = assignee.name
        if assignee.name == "Auto-Assign" {
            calendar.assigned = false
        } else {
            calendar.assigned = true
            calendar.assignment = assignee
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
        let text = calendarTitleTextField.text
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
        
        let calendarToSave = calendar.selectedCalendar
        
        if let title = calendarTitleTextField.text {
            calendarToSave?.title = title
        }
        
        if let details = calendarDetailsTextField.text {
            calendarToSave?.detail = details
        }
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    func loadCalendarData() {
        if let calendarToEdit = calendar.selectedCalendar {
            calendarTitleTextField.text = calendarToEdit.title
            calendarDetailsTextField.text = calendarToEdit.detail
        }
    }
    
    func loadCalendarAssignmentImage() {
        let assigned = calendar.assigned
        let assignee = calendar.assignment
        
        if assigned == true {
            calendarAssigneeMemberImage.image = assignee?.photo as? UIImage
            calendarAssigneeLabel.text = assignee?.name
        } else {
            calendarAssigneeMemberImage.image = #imageLiteral(resourceName: "Missing Profile")
            calendarAssigneeLabel.text = "Auto-Assign"
        }
    }
}

