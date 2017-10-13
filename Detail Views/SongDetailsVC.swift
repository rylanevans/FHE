//
//  SongDetailsVC.swift
//  FHE
//
//  Created by Rylan Evans on 10/13/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import CoreData

class SongDetailsVC: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var songThemePicker: UIPickerView!
    @IBOutlet weak var songThemeTextField: UITextField!
    @IBOutlet weak var songTitleTextField: UITextField!
    @IBOutlet weak var songSourceTextField: UITextField!
    @IBOutlet weak var songNumberTextField: UITextField!
    @IBOutlet weak var songURLTextField: UITextField!
    @IBAction func songActiveSwitch(_ sender: UISwitch) {
    }
    
    
    //    @IBAction func songThemePickerChanged(_ sender: UIPickerView) {
    //        showDateField.text = dateFormatter(date: eventDate.date as NSDate)
    //    }
    
    var songThemes = [Theme]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.clickSoundURL()
        
        self.hideKeyboardWhenTappedAround()
        
        songThemeTextField.inputView = songThemePicker
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.donePressedOnKeyboard))
        
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        
        
        songThemeTextField.delegate = self
        songThemePicker.dataSource = self
        songThemeTextField.attributedPlaceholder = NSAttributedString(string: "Atonement, Obedience, Commandments, etc.", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        songThemeTextField.inputAccessoryView = toolBar
        
        songTitleTextField.delegate = self
        songTitleTextField.attributedPlaceholder = NSAttributedString(string: "When there is love at home", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        songTitleTextField.inputAccessoryView = toolBar
        
        songSourceTextField.delegate = self
        songSourceTextField.attributedPlaceholder = NSAttributedString(string: "Hymn or Children's Book", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        songSourceTextField.inputAccessoryView = toolBar
        
        songNumberTextField.delegate = self
        songNumberTextField.attributedPlaceholder = NSAttributedString(string: "#33", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        songNumberTextField.inputAccessoryView = toolBar
        
        songURLTextField.delegate = self
        songURLTextField.attributedPlaceholder = NSAttributedString(string: "www.whateverthewebsiteis.com", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        songURLTextField.inputAccessoryView = toolBar
        
        //        let songTheme1 = Theme(context: context)
        //        songTheme1.theme = "Charity"
        //        let songTheme2 = Theme(context: context)
        //        songTheme2.theme = "Atonement"
        //        let songTheme3 = Theme(context: context)
        //        songTheme3.theme = "Articles of Faith"
        //        let songTheme4 = Theme(context: context)
        //        songTheme4.theme = "Commandments"
        //        let songTheme5 = Theme(context: context)
        //        songTheme5.theme = "Heavenly Father"
        //        let songTheme6 = Theme(context: context)
        //        songTheme6.theme = "Jesus Christ"
        //
        //        ad.saveContext()
        getThemes()
        checkValidMemberName()
        
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkValidMemberName()
        navigationItem.title = textField.text
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.isEnabled = false
    }
    
    func checkValidMemberName() {
        // Disable the Save button if the text field is empty.
        let text = songTitleTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    @objc func donePressedOnKeyboard() {
        view.endEditing(true)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let songTheme = songThemes[row]
        return songTheme.theme
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return songThemes.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // update when selected
    }
    
    func getThemes() {
        let fetchRequest: NSFetchRequest<Theme> = Theme.fetchRequest()
        
        do {
            self.songThemes = try context.fetch(fetchRequest)
            self.songThemePicker.reloadAllComponents()
        } catch {
            // handle the error
        }
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        playClick()
    }
    
    
}
