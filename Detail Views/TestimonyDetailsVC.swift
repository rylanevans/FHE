//
//  TestimonyDetailsVC.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import CoreData

class TestimonyDetailsVC: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var saveButton: BounceButton!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    @IBOutlet weak var hideSaveButton: UIImageView!
    @IBOutlet weak var testimonyTopicTextField: UITextField!
    @IBOutlet weak var testimonyTitleTextField: UITextField!
    @IBOutlet weak var testimonyBookTextField: UITextField!
    @IBOutlet weak var testimonyNumberTextField: UITextField!
    @IBOutlet weak var testimonyURLTextField: UITextField!
    @IBOutlet weak var testimonyOnDeckImage: UIImageView!
    @IBOutlet weak var testimonyFavorite: UIImageView!
    
    var testimonyBooks = testimonyBooksArray
    var testimonyTopics = lessonTopicsArray
    var testimonyToEdit: Testimony?
    var testimonyAssignment: Task?
    let testimonyTopicPicker = UIPickerView()
    let testimonyBookPicker = UIPickerView()
    
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
        
        testimonyTopicPicker.delegate = self
        testimonyTopicPicker.dataSource = self
        testimonyTopicPicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        testimonyBookPicker.delegate = self
        testimonyBookPicker.dataSource = self
        testimonyBookPicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        //        testimonyTopicTextField.delegate = self
        //        testimonyTopicTextField.attributedPlaceholder = NSAttributedString(string: "Select Topic", attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.7233663201, green: 0.7233663201, blue: 0.7233663201, alpha: 1)])
        //        testimonyTopicTextField.inputView = testimonyTopicPicker
        //        testimonyTopicPicker.tag = 1
        //        testimonyTopicTextField.inputAccessoryView = toolBar
        
        checkValidTitle()
        
        if testimonyToEdit != nil {
            loadTestimonyData()
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
        let text = testimonyTitleTextField.text ?? ""
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
            let testimonyTopic = testimonyTopics[row]
            return testimonyTopic
        } else {
            let testimonySource = testimonyBooks[row]
            return testimonySource
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return testimonyTopics.count
        } else {
            return testimonyBooks.count
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            let testimonyTopic = testimonyTopics[row]
            testimonyTopicTextField.text = testimonyTopic
        } else {
            testimonyBookTextField.text = testimonyBooks[row]
        }
    }
    
    @IBAction func testimonySelectedPressed(_ sender: Any) {
        if testimonyOnDeckImage.image == #imageLiteral(resourceName: "Selected") {
            testimonyOnDeckImage.image = #imageLiteral(resourceName: "NotSelected")
        } else {
            testimonyOnDeckImage.image = #imageLiteral(resourceName: "Selected")
        }
    }
    
    @IBAction func testimonyFavoriteButtonPressed(_ sender: Any) {
        if testimonyFavorite.image == #imageLiteral(resourceName: "FavoriteFilled") {
            testimonyFavorite.image = #imageLiteral(resourceName: "Favorite")
        } else {
            testimonyFavorite.image = #imageLiteral(resourceName: "FavoriteFilled")
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        playClick()
        
        var testimony: Testimony!
        
        if testimonyToEdit == nil {
            testimony = Testimony(context: context)
        } else {
            testimony = testimonyToEdit
        }
        
        if let topic = testimonyTopicTextField.text {
            testimony.topic = topic
        }
        
        if let book = testimonyBookTextField.text {
            testimony.book = book
        }
        
        if let title = testimonyTitleTextField.text {
            testimony.title = title
        }
        
        if testimonyNumberTextField.text != "" {
            let number = Int64(testimonyNumberTextField.text!)
            testimony.number = number!
        } else {
            let number = Int64(0)
            testimony.number = number
        }
        
        if let URL = testimonyURLTextField.text {
            testimony.url = URL
        }
        
        if testimonyOnDeckImage.image == #imageLiteral(resourceName: "Selected") {
            unselectEverything()
            testimony.selected = true
        } else {
            testimony.selected = false
        }
        
        if testimonyFavorite.image == #imageLiteral(resourceName: "FavoriteFilled") {
            testimony.favorite = true
        } else {
            testimony.favorite = false
        }
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    func loadTestimonyData() {
        if let testimony = testimonyToEdit {
            testimonyTopicTextField.text = testimony.topic
            testimonyTitleTextField.text = testimony.title
            testimonyBookTextField.text = testimony.book
            testimonyNumberTextField.text = String(testimony.number)
            testimonyURLTextField.text = testimony.url
            let onDeck = testimony.selected
            let favorite = testimony.favorite
            if onDeck == true {
                testimonyOnDeckImage.image = #imageLiteral(resourceName: "Selected")
            } else {
                testimonyOnDeckImage.image = #imageLiteral(resourceName: "NotSelected")
            }
            if favorite == true {
                testimonyFavorite.image = #imageLiteral(resourceName: "FavoriteFilled")
            } else {
                testimonyFavorite.image = #imageLiteral(resourceName: "Favorite")
            }
            
            textFieldDidEndEditing(testimonyTitleTextField)
        }
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        deleteAlertMessage()
    }
    
    func deleteAlertMessage() {
        let alertController = UIAlertController(title: "⚠️ DELETE WARNING!", message: "Are you sure you want to delete this testimony?", preferredStyle: .alert)
        
        let deleteAction = UIAlertAction(title: "✗ Delete", style: .default, handler: {
            alert -> Void in
            
            self.deleteTestimony()
        })
        
        let cancelAction = UIAlertAction(title: "⌀ Cancel", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func deleteTestimony() {
        if testimonyToEdit != nil {
            let testimony = testimonyToEdit
            if testimony?.selected == true {
                unselectEverything()
            }
            context.delete(testimonyToEdit!)
            ad.saveContext()
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    func unselectEverything() {
        for eachTestimony in testimonysArray {
            eachTestimony.selected = false
            eachTestimony.selectedOne = nil
            ad.saveContext()
        }
    }
}

