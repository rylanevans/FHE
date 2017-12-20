//
//  LessonDetailsVC.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import CoreData

class LessonDetailsVC: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var saveButton: BounceButton!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    @IBOutlet weak var hideSaveButton: UIImageView!
    @IBOutlet weak var lessonTopicTextField: UITextField!
    @IBOutlet weak var lessonTitleTextField: UITextField!
    @IBOutlet weak var lessonBookTextField: UITextField!
    @IBOutlet weak var lessonNumberTextField: UITextField!
    @IBOutlet weak var lessonURLTextField: UITextField!
    @IBOutlet weak var lessonOnDeckImage: UIImageView!
    @IBOutlet weak var lessonFavorite: UIImageView!
    
    var lessonBooks = lessonBooksArray
    var lessonTopics = lessonTopicsArray
    var lessonToEdit: Lesson?
    var lessonAssignment: Task?
    let lessonTopicPicker = UIPickerView()
    let lessonBookPicker = UIPickerView()
    
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
        
        lessonTopicPicker.delegate = self
        lessonTopicPicker.dataSource = self
        lessonTopicPicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        lessonBookPicker.delegate = self
        lessonBookPicker.dataSource = self
        lessonBookPicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        //        lessonTopicTextField.delegate = self
        //        lessonTopicTextField.attributedPlaceholder = NSAttributedString(string: "Select Topic", attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.7233663201, green: 0.7233663201, blue: 0.7233663201, alpha: 1)])
        //        lessonTopicTextField.inputView = lessonTopicPicker
        //        lessonTopicPicker.tag = 1
        //        lessonTopicTextField.inputAccessoryView = toolBar
        
        checkValidTitle()
        
        if lessonToEdit != nil {
            loadLessonData()
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
        let text = lessonTitleTextField.text ?? ""
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
            let lessonTopic = lessonTopics[row]
            return lessonTopic
        } else {
            let lessonSource = lessonBooks[row]
            return lessonSource
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return lessonTopics.count
        } else {
            return lessonBooks.count
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            let lessonTopic = lessonTopics[row]
            lessonTopicTextField.text = lessonTopic
        } else {
            lessonBookTextField.text = lessonBooks[row]
        }
    }
    
    @IBAction func lessonSelectedPressed(_ sender: Any) {
        if lessonOnDeckImage.image == #imageLiteral(resourceName: "Selected") {
            lessonOnDeckImage.image = #imageLiteral(resourceName: "NotSelected")
        } else {
            lessonOnDeckImage.image = #imageLiteral(resourceName: "Selected")
        }
    }
    
    @IBAction func lessonFavoriteButtonPressed(_ sender: Any) {
        if lessonFavorite.image == #imageLiteral(resourceName: "FavoriteFilled") {
            lessonFavorite.image = #imageLiteral(resourceName: "Favorite")
        } else {
            lessonFavorite.image = #imageLiteral(resourceName: "FavoriteFilled")
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        playClick()
        
        var lesson: Lesson!
        
        if lessonToEdit == nil {
            lesson = Lesson(context: context)
        } else {
            lesson = lessonToEdit
        }
        
        if let topic = lessonTopicTextField.text {
            lesson.topic = topic
        }
        
        if let book = lessonBookTextField.text {
            lesson.book = book
        }
        
        if let title = lessonTitleTextField.text {
            lesson.title = title
        }
        
        if lessonNumberTextField.text != "" {
            let number = Int64(lessonNumberTextField.text!)
            lesson.number = number!
        } else {
            let number = Int64(0)
            lesson.number = number
        }
        
        if let URL = lessonURLTextField.text {
            lesson.url = URL
        }
        
        if lessonOnDeckImage.image == #imageLiteral(resourceName: "Selected") {
            unselectEverything()
            lesson.selected = true
        } else {
            lesson.selected = false
        }
        
        if lessonFavorite.image == #imageLiteral(resourceName: "FavoriteFilled") {
            lesson.favorite = true
        } else {
            lesson.favorite = false
        }
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    func loadLessonData() {
        if let lesson = lessonToEdit {
            lessonTopicTextField.text = lesson.topic
            lessonTitleTextField.text = lesson.title
            lessonBookTextField.text = lesson.book
            lessonNumberTextField.text = String(lesson.number)
            lessonURLTextField.text = lesson.url
            let onDeck = lesson.selected
            let favorite = lesson.favorite
            if onDeck == true {
                lessonOnDeckImage.image = #imageLiteral(resourceName: "Selected")
            } else {
                lessonOnDeckImage.image = #imageLiteral(resourceName: "NotSelected")
            }
            if favorite == true {
                lessonFavorite.image = #imageLiteral(resourceName: "FavoriteFilled")
            } else {
                lessonFavorite.image = #imageLiteral(resourceName: "Favorite")
            }
            
            textFieldDidEndEditing(lessonTitleTextField)
        }
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        deleteAlertMessage()
    }
    
    func deleteAlertMessage() {
        let alertController = UIAlertController(title: "⚠️ DELETE WARNING!", message: "Are you sure you want to delete this lesson?", preferredStyle: .alert)
        
        let deleteAction = UIAlertAction(title: "✗ Delete", style: .default, handler: {
            alert -> Void in
            
            self.deleteLesson()
        })
        
        let cancelAction = UIAlertAction(title: "⌀ Cancel", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func deleteLesson() {
        if lessonToEdit != nil {
            let lesson = lessonToEdit
            if lesson?.selected == true {
                unselectEverything()
            }
            context.delete(lessonToEdit!)
            ad.saveContext()
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    func unselectEverything() {
        for eachLesson in lessonsArray {
            eachLesson.selected = false
            eachLesson.selectedOne = nil
            ad.saveContext()
        }
    }
}

