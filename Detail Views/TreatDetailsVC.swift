//
//  TreatDetailsVC.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import CoreData

class TreatDetailsVC: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var saveButton: BounceButton!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    @IBOutlet weak var hideSaveButton: UIImageView!
    @IBOutlet weak var treatTopicTextField: UITextField!
    @IBOutlet weak var treatTitleTextField: UITextField!
    @IBOutlet weak var treatBookTextField: UITextField!
    @IBOutlet weak var treatNumberTextField: UITextField!
    @IBOutlet weak var treatURLTextField: UITextField!
    @IBOutlet weak var treatOnDeckImage: UIImageView!
    @IBOutlet weak var treatFavorite: UIImageView!
    
    var treatBooks = treatBooksArray
    var treatTopics = lessonTopicsArray
    var treatToEdit: Treat?
    var treatAssignment: Task?
    let treatTopicPicker = UIPickerView()
    let treatBookPicker = UIPickerView()
    
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
        
        treatTopicPicker.delegate = self
        treatTopicPicker.dataSource = self
        treatTopicPicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        treatBookPicker.delegate = self
        treatBookPicker.dataSource = self
        treatBookPicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        //        treatTopicTextField.delegate = self
        //        treatTopicTextField.attributedPlaceholder = NSAttributedString(string: "Select Topic", attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.7233663201, green: 0.7233663201, blue: 0.7233663201, alpha: 1)])
        //        treatTopicTextField.inputView = treatTopicPicker
        //        treatTopicPicker.tag = 1
        //        treatTopicTextField.inputAccessoryView = toolBar
        
        checkValidTitle()
        
        if treatToEdit != nil {
            loadTreatData()
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
        let text = treatTitleTextField.text ?? ""
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
            let treatTopic = treatTopics[row]
            return treatTopic
        } else {
            let treatSource = treatBooks[row]
            return treatSource
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return treatTopics.count
        } else {
            return treatBooks.count
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            let treatTopic = treatTopics[row]
            treatTopicTextField.text = treatTopic
        } else {
            treatBookTextField.text = treatBooks[row]
        }
    }
    
    @IBAction func treatSelectedPressed(_ sender: Any) {
        if treatOnDeckImage.image == #imageLiteral(resourceName: "Selected") {
            treatOnDeckImage.image = #imageLiteral(resourceName: "NotSelected")
        } else {
            treatOnDeckImage.image = #imageLiteral(resourceName: "Selected")
        }
    }
    
    @IBAction func treatFavoriteButtonPressed(_ sender: Any) {
        if treatFavorite.image == #imageLiteral(resourceName: "FavoriteFilled") {
            treatFavorite.image = #imageLiteral(resourceName: "Favorite")
        } else {
            treatFavorite.image = #imageLiteral(resourceName: "FavoriteFilled")
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        playClick()
        
        var treat: Treat!
        
        if treatToEdit == nil {
            treat = Treat(context: context)
        } else {
            treat = treatToEdit
        }
        
        if let topic = treatTopicTextField.text {
            treat.topic = topic
        }
        
        if let book = treatBookTextField.text {
            treat.book = book
        }
        
        if let title = treatTitleTextField.text {
            treat.title = title
        }
        
        if treatNumberTextField.text != "" {
            let number = Int64(treatNumberTextField.text!)
            treat.number = number!
        } else {
            let number = Int64(0)
            treat.number = number
        }
        
        if let URL = treatURLTextField.text {
            treat.url = URL
        }
        
        if treatOnDeckImage.image == #imageLiteral(resourceName: "Selected") {
            unselectEverything()
            treat.selected = true
        } else {
            treat.selected = false
        }
        
        if treatFavorite.image == #imageLiteral(resourceName: "FavoriteFilled") {
            treat.favorite = true
        } else {
            treat.favorite = false
        }
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    func loadTreatData() {
        if let treat = treatToEdit {
            treatTopicTextField.text = treat.topic
            treatTitleTextField.text = treat.title
            treatBookTextField.text = treat.book
            treatNumberTextField.text = String(treat.number)
            treatURLTextField.text = treat.url
            let onDeck = treat.selected
            let favorite = treat.favorite
            if onDeck == true {
                treatOnDeckImage.image = #imageLiteral(resourceName: "Selected")
            } else {
                treatOnDeckImage.image = #imageLiteral(resourceName: "NotSelected")
            }
            if favorite == true {
                treatFavorite.image = #imageLiteral(resourceName: "FavoriteFilled")
            } else {
                treatFavorite.image = #imageLiteral(resourceName: "Favorite")
            }
            
            textFieldDidEndEditing(treatTitleTextField)
        }
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        deleteAlertMessage()
    }
    
    func deleteAlertMessage() {
        let alertController = UIAlertController(title: "⚠️ DELETE WARNING!", message: "Are you sure you want to delete this treat?", preferredStyle: .alert)
        
        let deleteAction = UIAlertAction(title: "✗ Delete", style: .default, handler: {
            alert -> Void in
            
            self.deleteTreat()
        })
        
        let cancelAction = UIAlertAction(title: "⌀ Cancel", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func deleteTreat() {
        if treatToEdit != nil {
            let treat = treatToEdit
            if treat?.selected == true {
                unselectEverything()
            }
            context.delete(treatToEdit!)
            ad.saveContext()
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    func unselectEverything() {
        for eachTreat in treatsCategoryArray {
            eachTreat.selected = false
            eachTreat.selectedOne = nil
            ad.saveContext()
        }
    }
}

