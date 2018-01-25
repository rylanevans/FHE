//
//  CPrayerDetailsVC.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import CoreData

class CPrayerDetailsVC: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var prayerTitleTextField: UITextField!
    @IBOutlet weak var prayerDetailsTextField: UITextView!
    @IBOutlet weak var closingAssigneeMemberImage: UIImageView!
    @IBOutlet weak var closingAssigneeLabel: UILabel!
    @IBOutlet weak var closingAssigneeText: UITextField!
    @IBOutlet weak var saveButton: BounceButton!
    @IBOutlet weak var hideSaveButton: UIImageView!
    
    let closingPicker = UIPickerView()
    
    let closingPrayer = taskPrayerClosing
    
    let prayer = taskPrayer
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        if closingPrayer.selectedPrayer != nil{
            loadPrayerData()
            checkValidTitle()
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
        
        if pickerView.tag == 2 {
            closingAssigneeMemberImage.image = assignee.photo as? UIImage
            closingAssigneeLabel.text = assignee.name
            if assignee.name == "Auto-Assign" {
                closingPrayer.assigned = false
            } else {
                closingPrayer.assigned = true
                closingPrayer.assignment = assignee
            }
            runAssignments()
            ad.saveContext()
        }
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
        let text = prayerTitleTextField.text
        if text?.isEmpty == false {
            hideSaveButton.isHidden = true
            saveButton.isEnabled = true
        } else {
            hideSaveButton.isHidden = false
            saveButton.isEnabled = false
            
            let alertController = UIAlertController(title: "⚠️ WARNING!", message: "In order to enable save option, you need a “Title”.", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "👌 OK", style: .default, handler: {
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
        let assigned = closingPrayer.assigned
        let assignee = closingPrayer.assignment
        
        if assigned == true {
            closingAssigneeMemberImage.image = assignee?.photo as? UIImage
            closingAssigneeLabel.text = assignee?.name
        } else {
            closingAssigneeMemberImage.image = #imageLiteral(resourceName: "Missing Profile")
            closingAssigneeLabel.text = "Auto-Assign"
        }
    }
}


