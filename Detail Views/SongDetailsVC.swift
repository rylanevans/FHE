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
    
    @IBOutlet weak var saveButton: BounceButton!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    @IBOutlet weak var hideSaveButton: UIImageView!
    @IBOutlet weak var songThemePicker: UIPickerView!
    @IBOutlet weak var songSourcePicker: UIPickerView!
    @IBOutlet weak var songThemeTextField: UITextField!
    @IBOutlet weak var songTitleTextField: UITextField!
    @IBOutlet weak var songSourceTextField: UITextField!
    @IBOutlet weak var songNumberTextField: UITextField!
    @IBOutlet weak var songURLTextField: UITextField!
    @IBOutlet weak var songSwitch: UISwitch!
    
    var songSources = ["Children's Song Book", "Hymn Book"]
    var songThemes = [Theme]()
    var songToEdit: Song?
    var songAssignment: Song?
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        self.clickSoundURL()
//        
//        self.hideKeyboardWhenTappedAround()
//        
//        let toolBar = UIToolbar()
//        toolBar.barStyle = UIBarStyle.default
//        toolBar.sizeToFit()
//        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
//        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.donePressedOnKeyboard))
//        toolBar.setItems([flexibleSpace, doneButton], animated: false)
//        
//        songThemePicker.delegate = self
//        songThemePicker.dataSource = self
//        songThemePicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
//        
//        songSourcePicker.delegate = self
//        songSourcePicker.dataSource = self
//        songSourcePicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
//        
//        songThemeTextField.delegate = self
//        songThemeTextField.attributedPlaceholder = NSAttributedString(string: "Commandments", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
//        songThemeTextField.inputView = songThemePicker
////        songThemeTextField.inputAccessoryView = toolBar
////        songThemePicker.frame.size.height = 225
//        
//        songTitleTextField.delegate = self
//        songTitleTextField.attributedPlaceholder = NSAttributedString(string: "When There's Love At Home", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
//        songTitleTextField.inputAccessoryView = toolBar
//        
//        songSourceTextField.delegate = self
//        songSourceTextField.attributedPlaceholder = NSAttributedString(string: "Hymn or Children's Book", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
//        songSourceTextField.inputView = songSourcePicker
//        songSourceTextField.inputAccessoryView = toolBar
//        
//        songNumberTextField.delegate = self
//        songNumberTextField.attributedPlaceholder = NSAttributedString(string: "33", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
//        songNumberTextField.inputAccessoryView = toolBar
//        
//        songURLTextField.delegate = self
//        songURLTextField.attributedPlaceholder = NSAttributedString(string: "www.EnterUniqueURLAddressHere.com", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
//        songURLTextField.inputAccessoryView = toolBar
//        
//
//        
////                        let songTheme1 = Theme(context: context)
////                        songTheme1.theme = "Charity"
////                        let songTheme2 = Theme(context: context)
////                        songTheme2.theme = "Atonement"
////                        let songTheme3 = Theme(context: context)
////                        songTheme3.theme = "Articles of Faith"
////                        let songTheme4 = Theme(context: context)
////                        songTheme4.theme = "Commandments"
////                        let songTheme5 = Theme(context: context)
////                        songTheme5.theme = "Heavenly Father"
////                        let songTheme6 = Theme(context: context)
////                        songTheme6.theme = "Jesus Christ"
////
////                        ad.saveContext()
//        
//        checkValidTitle()
//        getThemes()
//        
//        if songToEdit != nil {
//            loadSongData()
//        }
//    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkValidTitle()
        switch (textField.tag) {
        case 1:
            navigationItem.title = textField.text
            break;
        default:
            return
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
    
    func checkValidTitle() {
        let text = songTitleTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
        if text.isEmpty != true {
            hideSaveButton.isHidden = true
        }
    }
    
    @objc func donePressedOnKeyboard() {
        view.endEditing(true)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            let songTheme = songThemes[row]
            return songTheme.theme
        } else {
            let songSource = songSources[row]
            return songSource
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return songThemes.count
        } else {
            return songSources.count
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            let songTheme = songThemes[row]
            songThemeTextField.text = songTheme.theme
        } else {
            songSourceTextField.text = songSources[row]
        }
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
    
    @IBAction func songSwitchPressed(_ sender: UISwitch) {
        
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        playClick()
        
        let song = Song(context: context)
        
        if let theme = songThemeTextField.text {
            song.songTheme = theme
        }
        
        if let source = songSourceTextField.text {
            song.songSource = source
        }
        
        if let title = songTitleTextField.text {
            song.songTitle = title
        }
        
        if let number = songNumberTextField.text {
            song.songNumber = number
        }
        
        if let URL = songURLTextField.text {
            song.songURL = URL
        }
        
        if songSwitch.isOn == true {
            song.songActive = true
        }
        
        song.songImage = UIImagePNGRepresentation(#imageLiteral(resourceName: "Song"))
        
        //add songDateCreated
        
        ad.saveContext()
        navigationController?.popViewController(animated: true)
    }
    
    func loadSongData() {
        if let song = songToEdit {
            
            songThemeTextField.text = song.songTheme
            songTitleTextField.text = song.songTitle
            songSourceTextField.text = song.songSource
            songNumberTextField.text = song.songNumber
            songURLTextField.text = song.songURL
            songSwitch.isOn = song.songActive
        }
    }
    
//    func overrideSongAssignment() {
//        if let changeAssignmentTo = songAssignment {
//            if let relationship = changeAssignmentTo.songToMember {
//                var index = 0
//                repeat {
//                    let i = themes[index]
//                    if i.name == theme.name
//
//                } while (index < themes.count)
//            }
//        }
//
//    }

    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        
    }
    
    
}
