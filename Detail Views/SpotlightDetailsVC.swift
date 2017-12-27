//
//  SpotlightDetailsVC.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import CoreData

class SpotlightDetailsVC: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var spotlightTitleTextField: UITextField!
    @IBOutlet weak var spotlightDetailsTextField: UITextView!
    @IBOutlet weak var spotlightAssigneeMemberImage: UIImageView!
    @IBOutlet weak var spotlightAssigneeLabel: UILabel!
    @IBOutlet weak var spotlightAssigneeText: UITextField!
    
    let memberPicker = UIPickerView()
    
    let spotlight = taskSpotlight
    
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
        
        spotlightAssigneeText.inputView = memberPicker
        spotlightAssigneeText.inputAccessoryView = toolBar
        spotlightTitleTextField.inputAccessoryView = toolBar
        spotlightDetailsTextField.inputAccessoryView = toolBar
        
        self.clickSoundURL()
        
        self.hideKeyboardWhenTappedAround()
        
        getAllTasks()
        getSpotlights()
        getMembersForPicker()
        loadSpotlightData()
        loadSpotlightAssignmentImage()
        
        if spotlight.selectedSpotlight != nil {
            loadSpotlightData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        getAllTasks()
        getSpotlights()
        getMembersForPicker()
        loadSpotlightData()
        loadSpotlightAssignmentImage()
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
        let spotlight = taskSpotlight
        spotlightAssigneeMemberImage.image = assignee.photo as? UIImage
        spotlightAssigneeLabel.text = assignee.name
        spotlight.assignment = assignee
        if assignee.name == "Auto-Assign" {
            spotlight.assigned = false
        } else {
            spotlight.assigned = true
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
        
        let spotlightToSave = spotlight.selectedSpotlight
        
        if let title = spotlightTitleTextField.text {
            spotlightToSave?.title = title
        }
        
        if let details = spotlightDetailsTextField.text {
            spotlightToSave?.detail = details
        }
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    func loadSpotlightData() {
        if let spotlightToEdit = spotlight.selectedSpotlight {
            spotlightTitleTextField.text = spotlightToEdit.title
            spotlightDetailsTextField.text = spotlightToEdit.detail
        }
    }
    
    func loadSpotlightAssignmentImage() {
        let assignee = spotlight.assignment
        if assignee != nil {
            spotlightAssigneeMemberImage.image = assignee?.photo as? UIImage
            spotlightAssigneeLabel.text = assignee?.name
        } else {
            spotlightAssigneeMemberImage.image = #imageLiteral(resourceName: "Missing Profile")
            spotlightAssigneeLabel.text = "Auto-Assign"
        }
    }
}

