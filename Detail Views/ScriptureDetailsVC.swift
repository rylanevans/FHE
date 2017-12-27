//
//  ScriptureDetailsVC.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import CoreData

class ScriptureDetailsVC: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var saveButton: BounceButton!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    @IBOutlet weak var hideSaveButton: UIImageView!
    @IBOutlet weak var scriptureTopicTextField: UITextField!
    @IBOutlet weak var scriptureTitleTextField: UITextField!
    @IBOutlet weak var scriptureVolumeTextField: UITextField!
    @IBOutlet weak var scriptureBookTextField: UITextField!
    @IBOutlet weak var scriptureChapterTextField: UITextField!
    @IBOutlet weak var scriptureVerseTextField: UITextField!
    @IBOutlet weak var scriptureOnDeckImage: UIImageView!
    @IBOutlet weak var scriptureFavorite: UIImageView!
    
    let topics = lessonTopicsArray
    let volumes = scriptureVolumesArray
    let otBooks = scriptureOTBooksArray
    let ntBooks = scriptureNTBooksArray
    let bofmBooks = scriptureBofMBooksArray
    let pgpBooks = scripturePGPBooksArray
    let dcBooks = scriptureDCBooksArray
    var scriptureToEdit: Scripture?
    var scriptureAssignment: Task?
    let scriptureTopicPicker = UIPickerView()
    let scriptureVolumePicker = UIPickerView()
    let scriptureBookPicker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.clickSoundURL()
        
        self.hideKeyboardWhenTappedAround()
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.donePressedOnKeyboard))
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        
        scriptureTopicPicker.delegate = self
        scriptureTopicPicker.dataSource = self
        scriptureTopicPicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        scriptureVolumePicker.delegate = self
        scriptureVolumePicker.dataSource = self
        scriptureVolumePicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        scriptureTopicTextField.delegate = self
        scriptureTopicTextField.inputView = scriptureTopicPicker
        scriptureTopicTextField.tag = 1
        scriptureTopicTextField.inputAccessoryView = toolBar
        
        scriptureVolumeTextField.delegate = self
        scriptureVolumeTextField.inputView = scriptureVolumePicker
        scriptureVolumeTextField.tag = 2
        scriptureVolumeTextField.inputAccessoryView = toolBar
        
        scriptureBookTextField.delegate = self
        scriptureBookTextField.inputView = scriptureBookPicker
        scriptureBookTextField.tag = 3
        scriptureBookTextField.inputAccessoryView = toolBar
        
        scriptureTitleTextField.inputAccessoryView = toolBar
        scriptureChapterTextField.inputAccessoryView = toolBar
        scriptureVerseTextField.inputAccessoryView = toolBar
        
        checkValidTitle()
        
        if scriptureToEdit != nil {
            loadScriptureData()
        }
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkValidTitle()
        switch (textField.tag) {
        case 1: navigationItem.title = textField.text
        default: return
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
    
    func checkValidTitle() {
        let text = scriptureTitleTextField.text ?? ""
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
            let scriptureTopic = topics[row]
            return scriptureTopic
        } else {
            let scriptureSource = volumes[row]
            return scriptureSource
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1: return topics.count
        case 2: return volumes.count
        case 3:
            switch scriptureVolumeTextField.text {
            case "Old Testament"?: return otBooks.count
            case "New Testament"?: return ntBooks.count
            case "Book of Mormon"?: return bofmBooks.count
            case "Doctrine and Covenants"?: return dcBooks.count
            case "Pearl of Great Price"?: return pgpBooks.count
            default: return 1
            }
        default: return 0
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let scriptureTopic = topics[row]
        let scriptureVolume = volumes[row]
        let scriptureNT = ntBooks[row]
        let scriptureOT = otBooks[row]
        let scriptureBofM = bofmBooks[row]
        let scriptureDC = dcBooks[row]
        let scripturePGP = pgpBooks[row]
        
        switch pickerView.tag {
        case 1: scriptureTopicTextField.text = scriptureTopic
        case 2: scriptureVolumeTextField.text = scriptureVolume
        case 3:
            switch scriptureVolumeTextField.text {
            case "Old Testament"?: scriptureBookTextField.text = scriptureOT
            case "New Testament"?: scriptureBookTextField.text = scriptureNT
            case "Book of Mormon"?: scriptureBookTextField.text = scriptureBofM
            case "Doctrine and Covenants"?: scriptureBookTextField.text = scriptureDC
            case "Pearl of Great Price"?: scriptureBookTextField.text = scripturePGP
            default: scriptureBookTextField.text = "Select Scripture Volume First"
            }
        default: return
        }
    }
    
    @IBAction func scriptureSelectedPressed(_ sender: Any) {
        if scriptureOnDeckImage.image == #imageLiteral(resourceName: "Selected") {
            scriptureOnDeckImage.image = #imageLiteral(resourceName: "NotSelected")
        } else {
            scriptureOnDeckImage.image = #imageLiteral(resourceName: "Selected")
        }
    }
    
    @IBAction func scriptureFavoriteButtonPressed(_ sender: Any) {
        if scriptureFavorite.image == #imageLiteral(resourceName: "FavoriteFilled") {
            scriptureFavorite.image = #imageLiteral(resourceName: "Favorite")
        } else {
            scriptureFavorite.image = #imageLiteral(resourceName: "FavoriteFilled")
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        playClick()
        
        var scripture: Scripture!
        
        if scriptureToEdit == nil {
            scripture = Scripture(context: context)
        } else {
            scripture = scriptureToEdit
        }
        
        if let title = scriptureTitleTextField.text {
            scripture.title = title
        }
        
        if let topic = scriptureTopicTextField.text {
            scripture.topic = topic
        }
        
        if let volume = scriptureVolumeTextField.text {
            scripture.volume = volume
        }
        
        if let book = scriptureBookTextField.text {
            scripture.book = book
        }
        
        if let chapter = scriptureChapterTextField.text {
            scripture.chapter = chapter
        }
        
        if let verse = scriptureVerseTextField.text {
            scripture.verse = verse
        }
        
        if scriptureOnDeckImage.image == #imageLiteral(resourceName: "Selected") {
            unselectEverything()
            scripture.selected = true
            taskScripture.selectedScripture = scripture
        } else {
            scripture.selected = false
        }
        
        if scriptureFavorite.image == #imageLiteral(resourceName: "FavoriteFilled") {
            scripture.favorite = true
        } else {
            scripture.favorite = false
        }
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    func loadScriptureData() {
        if let scripture = scriptureToEdit {
            scriptureTopicTextField.text = scripture.topic
            scriptureTitleTextField.text = scripture.title
            scriptureVolumeTextField.text = scripture.volume
            scriptureBookTextField.text = scripture.book
            scriptureChapterTextField.text = scripture.chapter
            scriptureVerseTextField.text = scripture.verse
            let onDeck = scripture.selected
            let favorite = scripture.favorite
            if onDeck == true {
                scriptureOnDeckImage.image = #imageLiteral(resourceName: "Selected")
            } else {
                scriptureOnDeckImage.image = #imageLiteral(resourceName: "NotSelected")
            }
            if favorite == true {
                scriptureFavorite.image = #imageLiteral(resourceName: "FavoriteFilled")
            } else {
                scriptureFavorite.image = #imageLiteral(resourceName: "Favorite")
            }
            
            textFieldDidEndEditing(scriptureTitleTextField)
        }
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        deleteAlertMessage()
    }
    
    func deleteAlertMessage() {
        let alertController = UIAlertController(title: "⚠️ DELETE WARNING!", message: "Are you sure you want to delete this scripture?", preferredStyle: .alert)
        
        let deleteAction = UIAlertAction(title: "✗ Delete", style: .default, handler: {
            alert -> Void in
            
            self.deleteScripture()
        })
        
        let cancelAction = UIAlertAction(title: "⌀ Cancel", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func deleteScripture() {
        if scriptureToEdit != nil {
            let scripture = scriptureToEdit
            if scripture?.selected == true {
                unselectEverything()
            }
            context.delete(scriptureToEdit!)
            ad.saveContext()
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    func unselectEverything() {
        for eachScripture in scripturesArray {
            eachScripture.selected = false
            eachScripture.selectedOne = nil
            ad.saveContext()
        }
    }
}

