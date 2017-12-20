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
    
    @IBOutlet weak var saveButton: BounceButton!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    @IBOutlet weak var hideSaveButton: UIImageView!
    @IBOutlet weak var thoughtTopicTextField: UITextField!
    @IBOutlet weak var thoughtTitleTextField: UITextField!
    @IBOutlet weak var thoughtBookTextField: UITextField!
    @IBOutlet weak var thoughtNumberTextField: UITextField!
    @IBOutlet weak var thoughtURLTextField: UITextField!
    @IBOutlet weak var thoughtOnDeckImage: UIImageView!
    @IBOutlet weak var thoughtFavorite: UIImageView!
    
    var thoughtBooks = thoughtBooksArray
    var thoughtTopics = lessonTopicsArray
    var thoughtToEdit: Thought?
    var thoughtAssignment: Task?
    let thoughtTopicPicker = UIPickerView()
    let thoughtBookPicker = UIPickerView()
    
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
        
        thoughtTopicPicker.delegate = self
        thoughtTopicPicker.dataSource = self
        thoughtTopicPicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        thoughtBookPicker.delegate = self
        thoughtBookPicker.dataSource = self
        thoughtBookPicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        //        thoughtTopicTextField.delegate = self
        //        thoughtTopicTextField.attributedPlaceholder = NSAttributedString(string: "Select Topic", attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.7233663201, green: 0.7233663201, blue: 0.7233663201, alpha: 1)])
        //        thoughtTopicTextField.inputView = thoughtTopicPicker
        //        thoughtTopicPicker.tag = 1
        //        thoughtTopicTextField.inputAccessoryView = toolBar
        
        checkValidTitle()
        
        if thoughtToEdit != nil {
            loadThoughtData()
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
        let text = thoughtTitleTextField.text ?? ""
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
            let thoughtTopic = thoughtTopics[row]
            return thoughtTopic
        } else {
            let thoughtSource = thoughtBooks[row]
            return thoughtSource
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return thoughtTopics.count
        } else {
            return thoughtBooks.count
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            let thoughtTopic = thoughtTopics[row]
            thoughtTopicTextField.text = thoughtTopic
        } else {
            thoughtBookTextField.text = thoughtBooks[row]
        }
    }
    
    @IBAction func thoughtSelectedPressed(_ sender: Any) {
        if thoughtOnDeckImage.image == #imageLiteral(resourceName: "Selected") {
            thoughtOnDeckImage.image = #imageLiteral(resourceName: "NotSelected")
        } else {
            thoughtOnDeckImage.image = #imageLiteral(resourceName: "Selected")
        }
    }
    
    @IBAction func thoughtFavoriteButtonPressed(_ sender: Any) {
        if thoughtFavorite.image == #imageLiteral(resourceName: "FavoriteFilled") {
            thoughtFavorite.image = #imageLiteral(resourceName: "Favorite")
        } else {
            thoughtFavorite.image = #imageLiteral(resourceName: "FavoriteFilled")
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        playClick()
        
        var thought: Thought!
        
        if thoughtToEdit == nil {
            thought = Thought(context: context)
        } else {
            thought = thoughtToEdit
        }
        
        if let topic = thoughtTopicTextField.text {
            thought.topic = topic
        }
        
        if let book = thoughtBookTextField.text {
            thought.book = book
        }
        
        if let title = thoughtTitleTextField.text {
            thought.title = title
        }
        
        if thoughtNumberTextField.text != "" {
            let number = Int64(thoughtNumberTextField.text!)
            thought.number = number!
        } else {
            let number = Int64(0)
            thought.number = number
        }
        
        if let URL = thoughtURLTextField.text {
            thought.url = URL
        }
        
        if thoughtOnDeckImage.image == #imageLiteral(resourceName: "Selected") {
            unselectEverything()
            thought.selected = true
        } else {
            thought.selected = false
        }
        
        if thoughtFavorite.image == #imageLiteral(resourceName: "FavoriteFilled") {
            thought.favorite = true
        } else {
            thought.favorite = false
        }
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    func loadThoughtData() {
        if let thought = thoughtToEdit {
            thoughtTopicTextField.text = thought.topic
            thoughtTitleTextField.text = thought.title
            thoughtBookTextField.text = thought.book
            thoughtNumberTextField.text = String(thought.number)
            thoughtURLTextField.text = thought.url
            let onDeck = thought.selected
            let favorite = thought.favorite
            if onDeck == true {
                thoughtOnDeckImage.image = #imageLiteral(resourceName: "Selected")
            } else {
                thoughtOnDeckImage.image = #imageLiteral(resourceName: "NotSelected")
            }
            if favorite == true {
                thoughtFavorite.image = #imageLiteral(resourceName: "FavoriteFilled")
            } else {
                thoughtFavorite.image = #imageLiteral(resourceName: "Favorite")
            }
            
            textFieldDidEndEditing(thoughtTitleTextField)
        }
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        deleteAlertMessage()
    }
    
    func deleteAlertMessage() {
        let alertController = UIAlertController(title: "⚠️ DELETE WARNING!", message: "Are you sure you want to delete this thought?", preferredStyle: .alert)
        
        let deleteAction = UIAlertAction(title: "✗ Delete", style: .default, handler: {
            alert -> Void in
            
            self.deleteThought()
        })
        
        let cancelAction = UIAlertAction(title: "⌀ Cancel", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func deleteThought() {
        if thoughtToEdit != nil {
            let thought = thoughtToEdit
            if thought?.selected == true {
                unselectEverything()
            }
            context.delete(thoughtToEdit!)
            ad.saveContext()
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    func unselectEverything() {
        for eachThought in thoughtsArray {
            eachThought.selected = false
            eachThought.selectedOne = nil
            ad.saveContext()
        }
    }
}

