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
    @IBOutlet weak var scriptureBookTextField: UITextField!
    @IBOutlet weak var scriptureNumberTextField: UITextField!
    @IBOutlet weak var scriptureURLTextField: UITextField!
    @IBOutlet weak var scriptureOnDeckImage: UIImageView!
    @IBOutlet weak var scriptureFavorite: UIImageView!
    
    var scriptureBooks = scriptureBooksArray
    var scriptureTopics = lessonTopicsArray
    var scriptureToEdit: Scripture?
    var scriptureAssignment: Task?
    let scriptureTopicPicker = UIPickerView()
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
        
        scriptureBookPicker.delegate = self
        scriptureBookPicker.dataSource = self
        scriptureBookPicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        //        scriptureTopicTextField.delegate = self
        //        scriptureTopicTextField.attributedPlaceholder = NSAttributedString(string: "Select Topic", attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.7233663201, green: 0.7233663201, blue: 0.7233663201, alpha: 1)])
        //        scriptureTopicTextField.inputView = scriptureTopicPicker
        //        scriptureTopicPicker.tag = 1
        //        scriptureTopicTextField.inputAccessoryView = toolBar
        
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
            let scriptureTopic = scriptureTopics[row]
            return scriptureTopic
        } else {
            let scriptureSource = scriptureBooks[row]
            return scriptureSource
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return scriptureTopics.count
        } else {
            return scriptureBooks.count
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            let scriptureTopic = scriptureTopics[row]
            scriptureTopicTextField.text = scriptureTopic
        } else {
            scriptureBookTextField.text = scriptureBooks[row]
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
        
        if let topic = scriptureTopicTextField.text {
            scripture.topic = topic
        }
        
        if let book = scriptureBookTextField.text {
            scripture.book = book
        }
        
        if let title = scriptureTitleTextField.text {
            scripture.title = title
        }
        
        if scriptureNumberTextField.text != "" {
            let number = Int64(scriptureNumberTextField.text!)
            scripture.number = number!
        } else {
            let number = Int64(0)
            scripture.number = number
        }
        
        if let URL = scriptureURLTextField.text {
            scripture.url = URL
        }
        
        if scriptureOnDeckImage.image == #imageLiteral(resourceName: "Selected") {
            unselectEverything()
            scripture.selected = true
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
            scriptureBookTextField.text = scripture.book
            scriptureNumberTextField.text = String(scripture.number)
            scriptureURLTextField.text = scripture.url
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

