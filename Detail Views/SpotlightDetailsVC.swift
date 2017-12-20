//
//  SpotlightDetailsVC.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import CoreData

class SpotlightDetailsVC: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var saveButton: BounceButton!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    @IBOutlet weak var hideSaveButton: UIImageView!
    @IBOutlet weak var spotlightTopicTextField: UITextField!
    @IBOutlet weak var spotlightTitleTextField: UITextField!
    @IBOutlet weak var spotlightBookTextField: UITextField!
    @IBOutlet weak var spotlightNumberTextField: UITextField!
    @IBOutlet weak var spotlightURLTextField: UITextField!
    @IBOutlet weak var spotlightOnDeckImage: UIImageView!
    @IBOutlet weak var spotlightFavorite: UIImageView!
    
    var spotlightBooks = spotlightBooksArray
    var spotlightTopics = lessonTopicsArray
    var spotlightToEdit: Spotlight?
    var spotlightAssignment: Task?
    let spotlightTopicPicker = UIPickerView()
    let spotlightBookPicker = UIPickerView()
    
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
        
        spotlightTopicPicker.delegate = self
        spotlightTopicPicker.dataSource = self
        spotlightTopicPicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        spotlightBookPicker.delegate = self
        spotlightBookPicker.dataSource = self
        spotlightBookPicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        //        spotlightTopicTextField.delegate = self
        //        spotlightTopicTextField.attributedPlaceholder = NSAttributedString(string: "Select Topic", attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.7233663201, green: 0.7233663201, blue: 0.7233663201, alpha: 1)])
        //        spotlightTopicTextField.inputView = spotlightTopicPicker
        //        spotlightTopicPicker.tag = 1
        //        spotlightTopicTextField.inputAccessoryView = toolBar
        
        checkValidTitle()
        
        if spotlightToEdit != nil {
            loadSpotlightData()
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
        let text = spotlightTitleTextField.text ?? ""
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
            let spotlightTopic = spotlightTopics[row]
            return spotlightTopic
        } else {
            let spotlightSource = spotlightBooks[row]
            return spotlightSource
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return spotlightTopics.count
        } else {
            return spotlightBooks.count
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            let spotlightTopic = spotlightTopics[row]
            spotlightTopicTextField.text = spotlightTopic
        } else {
            spotlightBookTextField.text = spotlightBooks[row]
        }
    }
    
    @IBAction func spotlightSelectedPressed(_ sender: Any) {
        if spotlightOnDeckImage.image == #imageLiteral(resourceName: "Selected") {
            spotlightOnDeckImage.image = #imageLiteral(resourceName: "NotSelected")
        } else {
            spotlightOnDeckImage.image = #imageLiteral(resourceName: "Selected")
        }
    }
    
    @IBAction func spotlightFavoriteButtonPressed(_ sender: Any) {
        if spotlightFavorite.image == #imageLiteral(resourceName: "FavoriteFilled") {
            spotlightFavorite.image = #imageLiteral(resourceName: "Favorite")
        } else {
            spotlightFavorite.image = #imageLiteral(resourceName: "FavoriteFilled")
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        playClick()
        
        var spotlight: Spotlight!
        
        if spotlightToEdit == nil {
            spotlight = Spotlight(context: context)
        } else {
            spotlight = spotlightToEdit
        }
        
        if let topic = spotlightTopicTextField.text {
            spotlight.topic = topic
        }
        
        if let book = spotlightBookTextField.text {
            spotlight.book = book
        }
        
        if let title = spotlightTitleTextField.text {
            spotlight.title = title
        }
        
        if spotlightNumberTextField.text != "" {
            let number = Int64(spotlightNumberTextField.text!)
            spotlight.number = number!
        } else {
            let number = Int64(0)
            spotlight.number = number
        }
        
        if let URL = spotlightURLTextField.text {
            spotlight.url = URL
        }
        
        if spotlightOnDeckImage.image == #imageLiteral(resourceName: "Selected") {
            unselectEverything()
            spotlight.selected = true
        } else {
            spotlight.selected = false
        }
        
        if spotlightFavorite.image == #imageLiteral(resourceName: "FavoriteFilled") {
            spotlight.favorite = true
        } else {
            spotlight.favorite = false
        }
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    func loadSpotlightData() {
        if let spotlight = spotlightToEdit {
            spotlightTopicTextField.text = spotlight.topic
            spotlightTitleTextField.text = spotlight.title
            spotlightBookTextField.text = spotlight.book
            spotlightNumberTextField.text = String(spotlight.number)
            spotlightURLTextField.text = spotlight.url
            let onDeck = spotlight.selected
            let favorite = spotlight.favorite
            if onDeck == true {
                spotlightOnDeckImage.image = #imageLiteral(resourceName: "Selected")
            } else {
                spotlightOnDeckImage.image = #imageLiteral(resourceName: "NotSelected")
            }
            if favorite == true {
                spotlightFavorite.image = #imageLiteral(resourceName: "FavoriteFilled")
            } else {
                spotlightFavorite.image = #imageLiteral(resourceName: "Favorite")
            }
            
            textFieldDidEndEditing(spotlightTitleTextField)
        }
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        deleteAlertMessage()
    }
    
    func deleteAlertMessage() {
        let alertController = UIAlertController(title: "⚠️ DELETE WARNING!", message: "Are you sure you want to delete this spotlight?", preferredStyle: .alert)
        
        let deleteAction = UIAlertAction(title: "✗ Delete", style: .default, handler: {
            alert -> Void in
            
            self.deleteSpotlight()
        })
        
        let cancelAction = UIAlertAction(title: "⌀ Cancel", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func deleteSpotlight() {
        if spotlightToEdit != nil {
            let spotlight = spotlightToEdit
            if spotlight?.selected == true {
                unselectEverything()
            }
            context.delete(spotlightToEdit!)
            ad.saveContext()
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    func unselectEverything() {
        for eachSpotlight in spotlightsArray {
            eachSpotlight.selected = false
            eachSpotlight.selectedOne = nil
            ad.saveContext()
        }
    }
}

