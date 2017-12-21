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
    @IBOutlet weak var calendarDetailsTextField: UITextField!
    @IBOutlet weak var calendarAssigneeMemberImage: UIImageView!
    @IBOutlet weak var calendarAssigneeLabel: UILabel!
    @IBOutlet weak var calendarAssigneeText: UITextField!
    
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
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.donePressedOnKeyboard))
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        
        calendarAssigneeText.inputView = memberPicker
        calendarAssigneeText.inputAccessoryView = toolBar
        
        calendarDetailsTextField.delegate = self
        calendarDetailsTextField.attributedPlaceholder = NSAttributedString(string: "Enter Details...", attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.7233663201, green: 0.7233663201, blue: 0.7233663201, alpha: 1)])
        
        self.clickSoundURL()
        
        self.hideKeyboardWhenTappedAround()
        
        getTaskCalendar()
        getCalendars()
        getMembersForPicker()
        loadCalendarData()
        loadCalendarAssignmentImage()
        
        if calendar.selectedCalendar != nil {
            loadCalendarData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        getTaskCalendar()
        getCalendars()
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
        let calendar = taskCalendarsArray[0]
        calendarAssigneeMemberImage.image = assignee.photo as? UIImage
        calendarAssigneeLabel.text = assignee.name
        calendar.assignment = assignee
        if assignee.name == "Auto-Assign" {
            calendar.assigned = false
        } else {
            calendar.assigned = true
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
        let assignee = calendar.assignment
        if assignee != nil {
            calendarAssigneeMemberImage.image = assignee?.photo as? UIImage
            calendarAssigneeLabel.text = assignee?.name
        } else {
            calendarAssigneeMemberImage.image = #imageLiteral(resourceName: "Missing Profile")
            calendarAssigneeLabel.text = "Auto-Assign"
        }
    }
}

