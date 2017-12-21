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
    @IBOutlet weak var prayerDetailsTextField: UITextField!
    @IBOutlet weak var prayerAssigneeMemberImage: UIImageView!
    @IBOutlet weak var prayerAssigneeLabel: UILabel!
    @IBOutlet weak var prayerAssigneeText: UITextField!
    
    let memberPicker = UIPickerView()
    
    let prayer = taskPrayer
    
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
        
        prayerAssigneeText.inputView = memberPicker
        prayerAssigneeText.inputAccessoryView = toolBar
        
        prayerDetailsTextField.delegate = self
        prayerDetailsTextField.attributedPlaceholder = NSAttributedString(string: "Enter Details...", attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.7233663201, green: 0.7233663201, blue: 0.7233663201, alpha: 1)])
        
        self.clickSoundURL()
        
        self.hideKeyboardWhenTappedAround()
        
        getTaskPrayer()
        getPrayers()
        getMembersForPicker()
        loadPrayerData()
        loadPrayerAssignmentImage()
        
        if prayer.selectedPrayer != nil {
            loadPrayerData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        getTaskPrayer()
        getPrayers()
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
        let prayer = taskPrayersArray[0]
        prayerAssigneeMemberImage.image = assignee.photo as? UIImage
        prayerAssigneeLabel.text = assignee.name
        prayer.assignment = assignee
        if assignee.name == "Auto-Assign" {
            prayer.assigned = false
        } else {
            prayer.assigned = true
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
        
        let prayerToSave = prayer.selectedPrayer
        
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
        if let prayerToEdit = prayer.selectedPrayer {
            prayerTitleTextField.text = prayerToEdit.title
            prayerDetailsTextField.text = prayerToEdit.detail
        }
    }
    
    func loadPrayerAssignmentImage() {
        let assignee = prayer.assignment
        if assignee != nil {
            prayerAssigneeMemberImage.image = assignee?.photo as? UIImage
            prayerAssigneeLabel.text = assignee?.name
        } else {
            prayerAssigneeMemberImage.image = #imageLiteral(resourceName: "Missing Profile")
            prayerAssigneeLabel.text = "Auto-Assign"
        }
    }
}

