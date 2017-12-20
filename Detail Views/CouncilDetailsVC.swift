//
//  CouncilDetailsVC.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import CoreData

class CouncilDetailsVC: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var saveButton: BounceButton!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    @IBOutlet weak var hideSaveButton: UIImageView!
    @IBOutlet weak var councilTopicTextField: UITextField!
    @IBOutlet weak var councilTitleTextField: UITextField!
    @IBOutlet weak var councilBookTextField: UITextField!
    @IBOutlet weak var councilNumberTextField: UITextField!
    @IBOutlet weak var councilURLTextField: UITextField!
    @IBOutlet weak var councilOnDeckImage: UIImageView!
    @IBOutlet weak var councilFavorite: UIImageView!
    
    var councilBooks = councilBooksArray
    var councilTopics = lessonTopicsArray
    var councilToEdit: Council?
    var councilAssignment: Task?
    let councilTopicPicker = UIPickerView()
    let councilBookPicker = UIPickerView()
    
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
        
        councilTopicPicker.delegate = self
        councilTopicPicker.dataSource = self
        councilTopicPicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        councilBookPicker.delegate = self
        councilBookPicker.dataSource = self
        councilBookPicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        //        councilTopicTextField.delegate = self
        //        councilTopicTextField.attributedPlaceholder = NSAttributedString(string: "Select Topic", attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.7233663201, green: 0.7233663201, blue: 0.7233663201, alpha: 1)])
        //        councilTopicTextField.inputView = councilTopicPicker
        //        councilTopicPicker.tag = 1
        //        councilTopicTextField.inputAccessoryView = toolBar
        
        checkValidTitle()
        
        if councilToEdit != nil {
            loadCouncilData()
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
        let text = councilTitleTextField.text ?? ""
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
            let councilTopic = councilTopics[row]
            return councilTopic
        } else {
            let councilSource = councilBooks[row]
            return councilSource
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return councilTopics.count
        } else {
            return councilBooks.count
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            let councilTopic = councilTopics[row]
            councilTopicTextField.text = councilTopic
        } else {
            councilBookTextField.text = councilBooks[row]
        }
    }
    
    @IBAction func councilSelectedPressed(_ sender: Any) {
        if councilOnDeckImage.image == #imageLiteral(resourceName: "Selected") {
            councilOnDeckImage.image = #imageLiteral(resourceName: "NotSelected")
        } else {
            councilOnDeckImage.image = #imageLiteral(resourceName: "Selected")
        }
    }
    
    @IBAction func councilFavoriteButtonPressed(_ sender: Any) {
        if councilFavorite.image == #imageLiteral(resourceName: "FavoriteFilled") {
            councilFavorite.image = #imageLiteral(resourceName: "Favorite")
        } else {
            councilFavorite.image = #imageLiteral(resourceName: "FavoriteFilled")
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        playClick()
        
        var council: Council!
        
        if councilToEdit == nil {
            council = Council(context: context)
        } else {
            council = councilToEdit
        }
        
        if let topic = councilTopicTextField.text {
            council.topic = topic
        }
        
        if let book = councilBookTextField.text {
            council.book = book
        }
        
        if let title = councilTitleTextField.text {
            council.title = title
        }
        
        if councilNumberTextField.text != "" {
            let number = Int64(councilNumberTextField.text!)
            council.number = number!
        } else {
            let number = Int64(0)
            council.number = number
        }
        
        if let URL = councilURLTextField.text {
            council.url = URL
        }
        
        if councilOnDeckImage.image == #imageLiteral(resourceName: "Selected") {
            unselectEverything()
            council.selected = true
        } else {
            council.selected = false
        }
        
        if councilFavorite.image == #imageLiteral(resourceName: "FavoriteFilled") {
            council.favorite = true
        } else {
            council.favorite = false
        }
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    func loadCouncilData() {
        if let council = councilToEdit {
            councilTopicTextField.text = council.topic
            councilTitleTextField.text = council.title
            councilBookTextField.text = council.book
            councilNumberTextField.text = String(council.number)
            councilURLTextField.text = council.url
            let onDeck = council.selected
            let favorite = council.favorite
            if onDeck == true {
                councilOnDeckImage.image = #imageLiteral(resourceName: "Selected")
            } else {
                councilOnDeckImage.image = #imageLiteral(resourceName: "NotSelected")
            }
            if favorite == true {
                councilFavorite.image = #imageLiteral(resourceName: "FavoriteFilled")
            } else {
                councilFavorite.image = #imageLiteral(resourceName: "Favorite")
            }
            
            textFieldDidEndEditing(councilTitleTextField)
        }
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        deleteAlertMessage()
    }
    
    func deleteAlertMessage() {
        let alertController = UIAlertController(title: "⚠️ DELETE WARNING!", message: "Are you sure you want to delete this council?", preferredStyle: .alert)
        
        let deleteAction = UIAlertAction(title: "✗ Delete", style: .default, handler: {
            alert -> Void in
            
            self.deleteCouncil()
        })
        
        let cancelAction = UIAlertAction(title: "⌀ Cancel", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func deleteCouncil() {
        if councilToEdit != nil {
            let council = councilToEdit
            if council?.selected == true {
                unselectEverything()
            }
            context.delete(councilToEdit!)
            ad.saveContext()
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    func unselectEverything() {
        for eachCouncil in councilsArray {
            eachCouncil.selected = false
            eachCouncil.selectedOne = nil
            ad.saveContext()
        }
    }
}

