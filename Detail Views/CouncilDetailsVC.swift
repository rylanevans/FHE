//
//  CouncilDetailsVC.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import CoreData

class CouncilDetailsVC: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var councilTitleTextField: UITextField!
    @IBOutlet weak var councilDetailsTextField: UITextView!
    @IBOutlet weak var councilAssigneeMemberImage: UIImageView!
    @IBOutlet weak var councilAssigneeLabel: UILabel!
    @IBOutlet weak var councilAssigneeText: UITextField!
    
    let memberPicker = UIPickerView()
    
    let council = taskCouncil
    
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
        
        councilAssigneeText.inputView = memberPicker
        councilAssigneeText.inputAccessoryView = toolBar
        councilTitleTextField.inputAccessoryView = toolBar
        councilDetailsTextField.inputAccessoryView = toolBar
        
        self.clickSoundURL()
        
        self.hideKeyboardWhenTappedAround()
        
        getAllTasks()
        getMembersForPicker()
        loadCouncilData()
        loadCouncilAssignmentImage()
        
        if council.selectedCouncil != nil {
            loadCouncilData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        getAllTasks()
        getMembersForPicker()
        loadCouncilData()
        loadCouncilAssignmentImage()
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
        let council = taskCouncil
        councilAssigneeMemberImage.image = assignee.photo as? UIImage
        councilAssigneeLabel.text = assignee.name
        council.assignment = assignee
        if assignee.name == "Auto-Assign" {
            council.assigned = false
        } else {
            council.assigned = true
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
        
        let councilToSave = council.selectedCouncil
        
        if let title = councilTitleTextField.text {
            councilToSave?.title = title
        }
        
        if let details = councilDetailsTextField.text {
            councilToSave?.detail = details
        }
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    func loadCouncilData() {
        if let councilToEdit = council.selectedCouncil {
            councilTitleTextField.text = councilToEdit.title
            councilDetailsTextField.text = councilToEdit.detail
        }
    }
    
    func loadCouncilAssignmentImage() {
        let assignee = council.assignment
        if assignee != nil {
            councilAssigneeMemberImage.image = assignee?.photo as? UIImage
            councilAssigneeLabel.text = assignee?.name
        } else {
            councilAssigneeMemberImage.image = #imageLiteral(resourceName: "Missing Profile")
            councilAssigneeLabel.text = "Auto-Assign"
        }
    }
}

