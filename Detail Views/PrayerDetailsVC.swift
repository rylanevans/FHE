//
//  PrayerDetailsVC.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import CoreData

class PrayerDetailsVC: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var prayerTitleTextField: UITextField!
    @IBOutlet weak var prayerDetailsTextField: UITextView!
    @IBOutlet weak var prayerAssigneeMemberImage: UIImageView!
    @IBOutlet weak var prayerAssigneeLabel: UILabel!
    @IBOutlet weak var prayerAssigneeText: UITextField!
    @IBOutlet weak var closingAssigneeMemberImage: UIImageView!
    @IBOutlet weak var closingAssigneeLabel: UILabel!
    @IBOutlet weak var closingAssigneeText: UITextField!
    
    let openingPicker = UIPickerView()
    let closingPicker = UIPickerView()
    
    let openingPrayer = taskPrayer
    let closingPrayer = taskPrayerClosing
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        openingPicker.delegate = self
        openingPicker.dataSource = self
        openingPicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        openingPicker.tag = 1
        
        closingPicker.delegate = self
        closingPicker.dataSource = self
        closingPicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        closingPicker.tag = 2
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.donePressedOnKeyboard))
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        
        prayerAssigneeText.inputView = openingPicker
        prayerAssigneeText.inputAccessoryView = toolBar
        prayerTitleTextField.inputAccessoryView = toolBar
        prayerDetailsTextField.inputAccessoryView = toolBar
        
        closingAssigneeText.inputView = closingPicker
        closingAssigneeText.inputAccessoryView = toolBar
        
        self.clickSoundURL()
        
        self.hideKeyboardWhenTappedAround()
        
        getAllTasks()
        getMembersForPicker()
        loadPrayerData()
        loadPrayerAssignmentImage()
        
        if openingPrayer.selectedPrayer != nil || closingPrayer.selectedPrayer != nil{
            loadPrayerData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        getAllTasks()
        getMembersForPicker()
        loadPrayerData()
        loadPrayerAssignmentImage()
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
        
        if pickerView.tag == 1 {
            prayerAssigneeMemberImage.image = assignee.photo as? UIImage
            prayerAssigneeLabel.text = assignee.name
            openingPrayer.assignment = assignee
            if assignee.name == "Auto-Assign" {
                openingPrayer.assigned = false
            } else {
                openingPrayer.assigned = true
            }
            ad.saveContext()
        } else if pickerView.tag == 2 {
            closingAssigneeMemberImage.image = assignee.photo as? UIImage
            closingAssigneeLabel.text = assignee.name
            closingPrayer.assignment = assignee
            ad.saveContext()
        }

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
        
        let prayerToSave = openingPrayer.selectedPrayer
        
        if let title = prayerTitleTextField.text {
            prayerToSave?.title = title
        }
        
        if let details = prayerDetailsTextField.text {
            prayerToSave?.detail = details
        }
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    func loadPrayerData() {
        if let prayerToEdit = openingPrayer.selectedPrayer {
            prayerTitleTextField.text = prayerToEdit.title
            prayerDetailsTextField.text = prayerToEdit.detail
        }
    }
    
    func loadPrayerAssignmentImage() {
        let openingAssignee = openingPrayer.assignment
        
        let closingAssignee = closingPrayer.assignment
        
        if openingAssignee != nil {
            prayerAssigneeMemberImage.image = openingAssignee?.photo as? UIImage
            prayerAssigneeLabel.text = openingAssignee?.name
        } else {
            prayerAssigneeMemberImage.image = #imageLiteral(resourceName: "Missing Profile")
            prayerAssigneeLabel.text = "Auto-Assign"
        }
        
        if closingAssignee != nil {
            closingAssigneeMemberImage.image = closingAssignee?.photo as? UIImage
            closingAssigneeLabel.text = closingAssignee?.name
        } else {
            closingAssigneeMemberImage.image = #imageLiteral(resourceName: "Missing Profile")
            closingAssigneeLabel.text = "Auto-Assign"
        }
    }
}

