//
//  SongDetailsVC.swift
//  FHE
//
//  Created by Rylan Evans on 10/13/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import CoreData

class SongDetailsVC: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var saveButton: BounceButton!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    @IBOutlet weak var hideSaveButton: UIImageView!
    @IBOutlet weak var songTopicPicker: UIPickerView!
    @IBOutlet weak var songBookPicker: UIPickerView!
    @IBOutlet weak var songTopicTextField: UITextField!
    @IBOutlet weak var songTitleTextField: UITextField!
    @IBOutlet weak var songBookTextField: UITextField!
    @IBOutlet weak var songNumberTextField: UITextField!
    @IBOutlet weak var songURLTextField: UITextField!
    
    var songBooks = songBooksArray
    var songTopics = topicsArray
    var songToEdit: Song?
    var songAssignment: Song?
    
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
        
        songTopicPicker.delegate = self
        songTopicPicker.dataSource = self
        songTopicPicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        songBookPicker.delegate = self
        songBookPicker.dataSource = self
        songBookPicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        songTopicTextField.delegate = self
        songTopicTextField.attributedPlaceholder = NSAttributedString(string: "Commandments", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        songTopicTextField.inputView = songTopicPicker
        //        songTopicTextField.inputAccessoryView = toolBar
        //        songTopicPicker.frame.size.height = 225
        
        songTitleTextField.delegate = self
        songTitleTextField.attributedPlaceholder = NSAttributedString(string: "When There's Love At Home", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        songTitleTextField.inputAccessoryView = toolBar
        
        songBookTextField.delegate = self
        songBookTextField.attributedPlaceholder = NSAttributedString(string: "Hymn or Children's Book", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        songBookTextField.inputView = songBookPicker
//        songBookTextField.inputAccessoryView = toolBar
        
        songNumberTextField.delegate = self
        songNumberTextField.attributedPlaceholder = NSAttributedString(string: "33", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        songNumberTextField.inputAccessoryView = toolBar
        
        songURLTextField.delegate = self
        songURLTextField.attributedPlaceholder = NSAttributedString(string: "www.EnterUniqueURLAddressHere.com", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        songURLTextField.inputAccessoryView = toolBar
        
        
        
        //                        let songTopic1 = Topic(context: context)
        //                        songTopic1.Topic = "Charity"
        //                        let songTopic2 = Topic(context: context)
        //                        songTopic2.Topic = "Atonement"
        //                        let songTopic3 = Topic(context: context)
        //                        songTopic3.Topic = "Articles of Faith"
        //                        let songTopic4 = Topic(context: context)
        //                        songTopic4.Topic = "Commandments"
        //                        let songTopic5 = Topic(context: context)
        //                        songTopic5.Topic = "Heavenly Father"
        //                        let songTopic6 = Topic(context: context)
        //                        songTopic6.Topic = "Jesus Christ"
        //
        //                        ad.saveContext()
        
        checkValidTitle()
        
        if songToEdit != nil {
            loadSongData()
        }
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
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
        let text = songTitleTextField.text ?? ""
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
            let songTopic = songTopics[row]
            return songTopic
        } else {
            let songSource = songBooks[row]
            return songSource
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return songTopics.count
        } else {
            return songBooks.count
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            let songTopic = songTopics[row]
            songTopicTextField.text = songTopic
        } else {
            songBookTextField.text = songBooks[row]
        }
    }
    
//    func getTopics() {
//        let fetchRequest: NSFetchRequest<Topic> = Topic.fetchRequest()
//
//        do {
//            self.songTopics = try context.fetch(fetchRequest)
//            self.songTopicPicker.reloadAllComponents()
//        } catch {
//            // handle the error
//        }
//    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        playClick()
        
        let song: Song!
        
        if songToEdit == nil {
            song = Song(context: context)
        } else {
            song = songToEdit
        }
        
        if let topic = songTopicTextField.text {
            song.topic = topic
        }
        
        if let book = songBookTextField.text {
            song.book = book
        }
        
        if let title = songTitleTextField.text {
            song.title = title
        }
        
        if let number = songNumberTextField.text {
            song.number = number
        }
        
        if let URL = songURLTextField.text {
            song.url = URL
        }
        
        //add songDateCreated
        
        ad.saveContext()
    }
    
    func loadSongData() {
        if let song = songToEdit {
            
            songTopicTextField.text = song.topic
            songTitleTextField.text = song.title
            songBookTextField.text = song.book
            songNumberTextField.text = song.number
            songURLTextField.text = song.url
        }
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        if songToEdit != nil {
            context.delete(songToEdit!)
            ad.saveContext()
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    
}
