//
//  ThoughtDetailsVC.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import CoreData

class ThoughtDetailsVC: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var thoughtTitleTextField: UITextField!
    @IBOutlet weak var thoughtDetailsTextField: UITextView!
    @IBOutlet weak var thoughtAssigneeMemberImage: UIImageView!
    @IBOutlet weak var thoughtAssigneeLabel: UILabel!
    @IBOutlet weak var thoughtAssigneeText: UITextField!
    @IBOutlet weak var saveButton: BounceButton!
    @IBOutlet weak var hideSaveButton: UIImageView!
    @IBOutlet weak var thoughtURLTextField: UITextField!
    
    let memberPicker = UIPickerView()
    
    let thought = taskThought
    
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
        
        thoughtAssigneeText.inputView = memberPicker
        thoughtAssigneeText.inputAccessoryView = toolBar
        thoughtTitleTextField.inputAccessoryView = toolBar
        thoughtDetailsTextField.inputAccessoryView = toolBar
        thoughtURLTextField.inputAccessoryView = toolBar
        
        self.clickSoundURL()
        
        self.hideKeyboardWhenTappedAround()
        
        getAllTasks()
        getMembersForPicker()
        loadThoughtData()
        loadThoughtAssignmentImage()
        
        if thought.selectedThought != nil {
            loadThoughtData()
            checkValidTitle()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        getAllTasks()
        getMembersForPicker()
        loadThoughtData()
        loadThoughtAssignmentImage()
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
        let thought = taskThought
        thoughtAssigneeMemberImage.image = assignee.photo as? UIImage
        thoughtAssigneeLabel.text = assignee.name
        if assignee.name == "Auto-Assign" {
            thought.assigned = false
        } else {
            thought.assigned = true
            thought.assignment = assignee
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
        let text = thoughtTitleTextField.text
        let url = thoughtURLTextField.text
        if (text?.isEmpty == false && url?.isEmpty == true) ||
             (text?.isEmpty == false && url?.isEmpty == false &&
                 (url?.hasPrefix("http://") == true || url?.hasPrefix("https://") == true || url?.hasPrefix("www.") == true) &&
                 (url?.contains("bing") != true && url?.contains("google") != true && url?.contains("yahoo") != true && url?.contains("duckduckgo") != true && url?.contains("wiki") != true && url?.contains("sex") != true && url?.contains("porn") != true && url?.contains("porno") != true && url?.contains("xxx") != true && url?.contains("redtube") != true && url?.contains("dailydot") != true)) {
            hideSaveButton.isHidden = true
            saveButton.isEnabled = true
        } else {
            hideSaveButton.isHidden = false
            saveButton.isEnabled = false
            
            let alertController = UIAlertController(title: "⚠ WARNING!", message: "In order to enable save option, you need a “Title” and if you have a URL it must be a direct link to a website or youtube video.", preferredStyle: .alert)
            
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
        
        let thoughtToSave = thought.selectedThought
        
        if let title = thoughtTitleTextField.text {
            thoughtToSave?.title = title
        }
        
        if let details = thoughtDetailsTextField.text {
            thoughtToSave?.detail = details
        }
        
        if let url = thoughtURLTextField.text {
            thoughtToSave?.url = url
        }
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    func loadThoughtData() {
        if let thoughtToEdit = thought.selectedThought {
            thoughtTitleTextField.text = thoughtToEdit.title
            thoughtDetailsTextField.text = thoughtToEdit.detail
            thoughtURLTextField.text = thoughtToEdit.url
        }
    }
    
    func loadThoughtAssignmentImage() {
        let assigned = thought.assigned
        let assignee = thought.assignment
        
        if assigned == true {
            thoughtAssigneeMemberImage.image = assignee?.photo as? UIImage
            thoughtAssigneeLabel.text = assignee?.name
        } else {
            thoughtAssigneeMemberImage.image = #imageLiteral(resourceName: "Missing Profile")
            thoughtAssigneeLabel.text = "Auto-Assign"
        }
    }
}

