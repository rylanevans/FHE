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
    @IBOutlet weak var lessonCategoryTextField: UITextField!
    @IBOutlet weak var lessonTopicTextField: UITextField!
    @IBOutlet weak var lessonTitleTextField: UITextField!
    @IBOutlet weak var lessonDetailsTextField: UITextField!
    @IBOutlet weak var lessonURLTextField: UITextField!
    @IBOutlet weak var lessonOnDeckImage: UIImageView!
    @IBOutlet weak var lessonFavorite: UIImageView!
    @IBOutlet weak var lessonYouTubeImage: UIImageView!
    
    var lessonCategory = lessonCategoryArray
    var lessonTopics = lessonTopicsArray
    var lessonAspects = lessonAspectArray
    var lessonToEdit: Lesson?
    var lessonAssignment: Task?
    let lessonTopicPicker = UIPickerView()
    let lessonCategoryPicker = UIPickerView()
    
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
        
        lessonCategoryPicker.delegate = self
        lessonCategoryPicker.dataSource = self
        lessonCategoryPicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        lessonCategoryPicker.tag = 1
        
        lessonCategoryTextField.delegate = self
        lessonCategoryTextField.inputView = lessonCategoryPicker
        lessonCategoryTextField.inputAccessoryView = toolBar
        
        lessonTopicTextField.delegate = self
        lessonTopicTextField.inputView = lessonTopicPicker
        lessonTopicTextField.inputAccessoryView = toolBar
        
        lessonTitleTextField.inputAccessoryView = toolBar
        lessonDetailsTextField.inputAccessoryView = toolBar
        lessonURLTextField.inputAccessoryView = toolBar
        
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
            let category = lessonCategory[row]
            return category
        } else {
            if lessonCategoryTextField.text == "Temporal" {
                let topic = lessonAspects[row]
                return topic
            } else {
                let topic = lessonTopics[row]
                return topic
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return lessonCategory.count
        } else {
            if lessonCategoryTextField.text == "Temporal" {
                return lessonAspects.count
            } else {
                return lessonTopics.count
            }
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            let lessonCategory = self.lessonCategory[row]
            lessonCategoryTextField.text = lessonCategory
        } else {
            if lessonCategoryTextField.text == "Temporal" {
                let topic = self.lessonAspects[row]
                lessonTopicTextField.text = topic
            } else {
                let topic = self.lessonTopics[row]
                lessonTopicTextField.text = topic
            }
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
    
    @IBAction func lessonYouTubeButtonPressed(_ sender: Any) {
        if lessonYouTubeImage.image == #imageLiteral(resourceName: "Selected") {
            lessonYouTubeImage.image = #imageLiteral(resourceName: "NotSelected")
        } else {
            lessonYouTubeImage.image = #imageLiteral(resourceName: "Selected")
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
        
        if let title = lessonTitleTextField.text {
            lesson.title = title
            lesson.alphabet = String(describing: title[(title.startIndex)])
        }
        
        if let category = lessonCategoryTextField.text {
            lesson.category = category
        }
        
        if let topic = lessonTopicTextField.text {
            lesson.topic = topic
        }
        
        if let detail = lessonDetailsTextField.text {
            lesson.detail = detail
        }
        
        if let URL = lessonURLTextField.text {
            lesson.url = URL
        }
        
        if lessonYouTubeImage.image == #imageLiteral(resourceName: "Selected") {
            lesson.youTubeVideo = true
        } else {
            lesson.youTubeVideo = false
        }
        
        if lessonOnDeckImage.image == #imageLiteral(resourceName: "Selected") {
            unselectEverything()
            lesson.selected = true
            taskLesson.selectedLesson = lesson
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
            lessonCategoryTextField.text = lesson.category
            lessonDetailsTextField.text = lesson.detail
            lessonURLTextField.text = lesson.url
            let youTube = lesson.youTubeVideo
            let onDeck = lesson.selected
            let favorite = lesson.favorite
            if youTube == true {
                lessonYouTubeImage.image = #imageLiteral(resourceName: "Selected")
            } else {
                lessonYouTubeImage.image = #imageLiteral(resourceName: "NotSelected")
            }
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

