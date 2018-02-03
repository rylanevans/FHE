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
    @IBOutlet weak var saveButton: BounceButton!
    @IBOutlet weak var hideSaveButton: UIImageView!
    @IBOutlet weak var councilURLTextField: UITextField!
    
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
        councilURLTextField.inputAccessoryView = toolBar
        
        self.clickSoundURL()
        
        self.hideKeyboardWhenTappedAround()
        
        getAllTasks()
        getMembersForPicker()
        loadCouncilData()
        loadCouncilAssignmentImage()
        
        if council.selectedCouncil != nil {
            loadCouncilData()
            checkValidTitle()
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
        if assignee.name == "Auto-Assign" {
            council.assigned = false
        } else {
            council.assigned = true
            council.assignment = assignee
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
        let text = councilTitleTextField.text
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
        
        let councilToSave = council.selectedCouncil
        
        if let title = councilTitleTextField.text {
            councilToSave?.title = title
        }
        
        if let details = councilDetailsTextField.text {
            councilToSave?.detail = details
        }
        
        if let url = councilURLTextField.text {
            councilToSave?.url = url
        }
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    func loadCouncilData() {
        if let councilToEdit = council.selectedCouncil {
            councilTitleTextField.text = councilToEdit.title
            councilDetailsTextField.text = councilToEdit.detail
            councilURLTextField.text = councilToEdit.url
        }
    }
    
    func loadCouncilAssignmentImage() {
        let assigned = council.assigned
        let assignee = council.assignment
        
        if assigned == true {
            councilAssigneeMemberImage.image = assignee?.photo as? UIImage
            councilAssigneeLabel.text = assignee?.name
        } else {
            councilAssigneeMemberImage.image = #imageLiteral(resourceName: "Missing Profile")
            councilAssigneeLabel.text = "Auto-Assign"
        }
    }
}

