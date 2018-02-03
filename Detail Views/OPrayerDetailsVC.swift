//
//  PrayerDetailsVC.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import CoreData

class OPrayerDetailsVC: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var prayerTitleTextField: UITextField!
    @IBOutlet weak var prayerDetailsTextField: UITextView!
    @IBOutlet weak var prayerAssigneeMemberImage: UIImageView!
    @IBOutlet weak var prayerAssigneeLabel: UILabel!
    @IBOutlet weak var prayerAssigneeText: UITextField!
    @IBOutlet weak var saveButton: BounceButton!
    @IBOutlet weak var hideSaveButton: UIImageView!
    
    let openingPicker = UIPickerView()
    
    let openingPrayer = taskPrayer
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        openingPicker.delegate = self
        openingPicker.dataSource = self
        openingPicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        openingPicker.tag = 1
        
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
        
        self.clickSoundURL()
        
        self.hideKeyboardWhenTappedAround()
        
        getAllTasks()
        getMembersForPicker()
        loadPrayerData()
        loadPrayerAssignmentImage()
        
        if openingPrayer.selectedPrayer != nil{
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
        
        if pickerView.tag == 1 {
            prayerAssigneeMemberImage.image = assignee.photo as? UIImage
            prayerAssigneeLabel.text = assignee.name
            openingPrayer.assignment = assignee
            if assignee.name == "Auto-Assign" {
                openingPrayer.assigned = false
                runAssignments()
            } else {
                openingPrayer.assigned = true
                runAssignments()
            }
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
        let assigned = openingPrayer.assigned
        let openingAssignee = openingPrayer.assignment
        
        if assigned == true {
            prayerAssigneeMemberImage.image = openingAssignee?.photo as? UIImage
            prayerAssigneeLabel.text = openingAssignee?.name
        } else {
            prayerAssigneeMemberImage.image = #imageLiteral(resourceName: "Missing Profile")
            prayerAssigneeLabel.text = "Auto-Assign"
        }
    }
}

