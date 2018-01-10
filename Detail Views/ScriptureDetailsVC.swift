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
    let allBooks = scriptureAllBooksArray
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
        
        scriptureBookPicker.delegate = self
        scriptureBookPicker.dataSource = self
        scriptureBookPicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        scriptureTopicTextField.delegate = self
        scriptureTopicTextField.inputView = scriptureTopicPicker
        scriptureTopicPicker.tag = 1
        scriptureTopicTextField.inputAccessoryView = toolBar
        
        scriptureVolumeTextField.delegate = self
        scriptureVolumeTextField.inputView = scriptureVolumePicker
        scriptureVolumePicker.tag = 2
        scriptureVolumeTextField.inputAccessoryView = toolBar
        
        scriptureBookTextField.delegate = self
        scriptureBookTextField.inputView = scriptureBookPicker
        scriptureBookPicker.tag = 3
        scriptureBookTextField.inputAccessoryView = toolBar
        
        scriptureTitleTextField.inputAccessoryView = toolBar
        scriptureChapterTextField.inputAccessoryView = toolBar
        scriptureVerseTextField.inputAccessoryView = toolBar
        
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
        return
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
    
    func checkValidTitle() {
        let text = scriptureTitleTextField.text
        if text?.isEmpty == false {
            hideSaveButton.isHidden = true
            self.navigationItem.title = text
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
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            let scriptureTopic = topics[row]
            return scriptureTopic
        case 2:
            let scriptureVolume = volumes[row]
            return scriptureVolume
        case 3:
            switch scriptureVolumeTextField.text {
            case "ot"?:
                let scriptureBook = otBooks[row]
                return scriptureBook
            case "nt"?:
                let scriptureBook = ntBooks[row]
                return scriptureBook
            case "bofm"?:
                let scriptureBook = bofmBooks[row]
                return scriptureBook
            case "dc-testament"?:
                let scriptureBook = dcBooks[row]
                return scriptureBook
            case "pgp"?:
                let scriptureBook = pgpBooks[row]
                return scriptureBook
            default:
                let scriptureAll = allBooks[row]
                return scriptureAll
            }
        default:
            let scriptureTopic = topics[row]
            return scriptureTopic
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1: return topics.count
        case 2: return volumes.count
        case 3:
            switch scriptureVolumeTextField.text {
            case "ot"?: return otBooks.count
            case "nt"?: return ntBooks.count
            case "bofm"?: return bofmBooks.count
            case "dc-testament"?: return dcBooks.count
            case "pgp"?: return pgpBooks.count
            default: return allBooks.count
            }
        default: return 0
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            let scriptureTopic = topics[row]
            scriptureTopicTextField.text = scriptureTopic
        case 2:
            let scriptureVolume = volumes[row]
            let scriptureName = scriptureVolumesDictionary[scriptureVolume]
            scriptureVolumeTextField.text = scriptureName
        case 3:
            switch scriptureVolumeTextField.text {
            case "ot"?:
                let scriptureOT = otBooks[row]
                let scriptureArray = scripturesDictionary[scriptureOT]
                let book = scriptureArray![0]
                scriptureBookTextField.text = (book as! String)
            case "nt"?:
                let scriptureNT = ntBooks[row]
                let scriptureArray = scripturesDictionary[scriptureNT]
                let book = scriptureArray![0]
                scriptureBookTextField.text = (book as! String)
            case "bofm"?:
                let scriptureBofM = bofmBooks[row]
                let scriptureArray = scripturesDictionary[scriptureBofM]
                let book = scriptureArray![0]
                scriptureBookTextField.text = (book as! String)
            case "dc-testament"?:
                let scriptureDC = dcBooks[row]
                let scriptureArray = scripturesDictionary[scriptureDC]
                let book = scriptureArray![0]
                scriptureBookTextField.text = (book as! String)
            case "pgp"?:
                let scripturePGP = pgpBooks[row]
                let scriptureArray = scripturesDictionary[scripturePGP]
                let book = scriptureArray![0]
                scriptureBookTextField.text = (book as! String)
            default: scriptureBookTextField.text = "Select Volume 1st"
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
            scripture.alphabet = String(describing: title[(title.startIndex)])
        }
        
        if let topic = scriptureTopicTextField.text {
            scripture.topic = topic
        }
        
        if let volume = scriptureVolumeTextField.text {
            scripture.volume = volume
        }
        
        if let book = scriptureBookTextField.text {
            scripture.book = book
            scripture.order = Int64(defaultScriptureDictionary["\(book)"]!)
        }
        
        if let chapter = scriptureChapterTextField.text {
            scripture.chapter = Int64(chapter)!
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
            scriptureChapterTextField.text = String(scripture.chapter)
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

