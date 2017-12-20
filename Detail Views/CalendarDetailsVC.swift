//
//  CalendarDetailsVC.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import CoreData

class CalendarDetailsVC: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var saveButton: BounceButton!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    @IBOutlet weak var hideSaveButton: UIImageView!
    @IBOutlet weak var calendarTopicTextField: UITextField!
    @IBOutlet weak var calendarTitleTextField: UITextField!
    @IBOutlet weak var calendarBookTextField: UITextField!
    @IBOutlet weak var calendarNumberTextField: UITextField!
    @IBOutlet weak var calendarURLTextField: UITextField!
    @IBOutlet weak var calendarOnDeckImage: UIImageView!
    @IBOutlet weak var calendarFavorite: UIImageView!
    
    var calendarBooks = calendarBooksArray
    var calendarTopics = lessonTopicsArray
    var calendarToEdit: Calendar?
    var calendarAssignment: Task?
    let calendarTopicPicker = UIPickerView()
    let calendarBookPicker = UIPickerView()
    
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
        
        calendarTopicPicker.delegate = self
        calendarTopicPicker.dataSource = self
        calendarTopicPicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        calendarBookPicker.delegate = self
        calendarBookPicker.dataSource = self
        calendarBookPicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        //        calendarTopicTextField.delegate = self
        //        calendarTopicTextField.attributedPlaceholder = NSAttributedString(string: "Select Topic", attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.7233663201, green: 0.7233663201, blue: 0.7233663201, alpha: 1)])
        //        calendarTopicTextField.inputView = calendarTopicPicker
        //        calendarTopicPicker.tag = 1
        //        calendarTopicTextField.inputAccessoryView = toolBar
        
        checkValidTitle()
        
        if calendarToEdit != nil {
            loadCalendarData()
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
        let text = calendarTitleTextField.text ?? ""
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
            let calendarTopic = calendarTopics[row]
            return calendarTopic
        } else {
            let calendarSource = calendarBooks[row]
            return calendarSource
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return calendarTopics.count
        } else {
            return calendarBooks.count
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            let calendarTopic = calendarTopics[row]
            calendarTopicTextField.text = calendarTopic
        } else {
            calendarBookTextField.text = calendarBooks[row]
        }
    }
    
    @IBAction func calendarSelectedPressed(_ sender: Any) {
        if calendarOnDeckImage.image == #imageLiteral(resourceName: "Selected") {
            calendarOnDeckImage.image = #imageLiteral(resourceName: "NotSelected")
        } else {
            calendarOnDeckImage.image = #imageLiteral(resourceName: "Selected")
        }
    }
    
    @IBAction func calendarFavoriteButtonPressed(_ sender: Any) {
        if calendarFavorite.image == #imageLiteral(resourceName: "FavoriteFilled") {
            calendarFavorite.image = #imageLiteral(resourceName: "Favorite")
        } else {
            calendarFavorite.image = #imageLiteral(resourceName: "FavoriteFilled")
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        playClick()
        
        var calendar: Calendar!
        
        if calendarToEdit == nil {
            calendar = Calendar(context: context)
        } else {
            calendar = calendarToEdit
        }
        
        if let topic = calendarTopicTextField.text {
            calendar.topic = topic
        }
        
        if let book = calendarBookTextField.text {
            calendar.book = book
        }
        
        if let title = calendarTitleTextField.text {
            calendar.title = title
        }
        
        if calendarNumberTextField.text != "" {
            let number = Int64(calendarNumberTextField.text!)
            calendar.number = number!
        } else {
            let number = Int64(0)
            calendar.number = number
        }
        
        if let URL = calendarURLTextField.text {
            calendar.url = URL
        }
        
        if calendarOnDeckImage.image == #imageLiteral(resourceName: "Selected") {
            unselectEverything()
            calendar.selected = true
        } else {
            calendar.selected = false
        }
        
        if calendarFavorite.image == #imageLiteral(resourceName: "FavoriteFilled") {
            calendar.favorite = true
        } else {
            calendar.favorite = false
        }
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    func loadCalendarData() {
        if let calendar = calendarToEdit {
            calendarTopicTextField.text = calendar.topic
            calendarTitleTextField.text = calendar.title
            calendarBookTextField.text = calendar.book
            calendarNumberTextField.text = String(calendar.number)
            calendarURLTextField.text = calendar.url
            let onDeck = calendar.selected
            let favorite = calendar.favorite
            if onDeck == true {
                calendarOnDeckImage.image = #imageLiteral(resourceName: "Selected")
            } else {
                calendarOnDeckImage.image = #imageLiteral(resourceName: "NotSelected")
            }
            if favorite == true {
                calendarFavorite.image = #imageLiteral(resourceName: "FavoriteFilled")
            } else {
                calendarFavorite.image = #imageLiteral(resourceName: "Favorite")
            }
            
            textFieldDidEndEditing(calendarTitleTextField)
        }
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        deleteAlertMessage()
    }
    
    func deleteAlertMessage() {
        let alertController = UIAlertController(title: "⚠️ DELETE WARNING!", message: "Are you sure you want to delete this calendar?", preferredStyle: .alert)
        
        let deleteAction = UIAlertAction(title: "✗ Delete", style: .default, handler: {
            alert -> Void in
            
            self.deleteCalendar()
        })
        
        let cancelAction = UIAlertAction(title: "⌀ Cancel", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func deleteCalendar() {
        if calendarToEdit != nil {
            let calendar = calendarToEdit
            if calendar?.selected == true {
                unselectEverything()
            }
            context.delete(calendarToEdit!)
            ad.saveContext()
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    func unselectEverything() {
        for eachCalendar in calendarsArray {
            eachCalendar.selected = false
            eachCalendar.selectedOne = nil
            ad.saveContext()
        }
    }
}

