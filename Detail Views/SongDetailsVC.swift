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
    @IBOutlet weak var songTopicTextField: UITextField!
    @IBOutlet weak var songTitleTextField: UITextField!
    @IBOutlet weak var songBookTextField: UITextField!
    @IBOutlet weak var songNumberTextField: UITextField!
    @IBOutlet weak var songURLTextField: UITextField!
    @IBOutlet weak var songOnDeckImage: UIImageView!
    @IBOutlet weak var songFavorite: UIImageView!
    
    
    var songBooks = songBooksArray
    var songTopics = topicsArray
    var songToEdit: Song?
    var songAssignment: Task?
    let songTopicPicker = UIPickerView()
    let songBookPicker = UIPickerView()
    
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
        songTopicTextField.attributedPlaceholder = NSAttributedString(string: "Commandments", attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)])
        songTopicTextField.inputView = songTopicPicker
        songTopicPicker.tag = 1
        songTopicTextField.inputAccessoryView = toolBar
        
        songTitleTextField.delegate = self
        songTitleTextField.attributedPlaceholder = NSAttributedString(string: "Love At Home", attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)])
        songTitleTextField.inputAccessoryView = toolBar
        
        songBookTextField.delegate = self
        songBookTextField.attributedPlaceholder = NSAttributedString(string: "Hymns or Children's", attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)])
        songBookTextField.inputView = songBookPicker
        songBookPicker.tag = 2
        songBookTextField.inputAccessoryView = toolBar
        
        songNumberTextField.delegate = self
        songNumberTextField.attributedPlaceholder = NSAttributedString(string: "294", attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)])
        songNumberTextField.inputAccessoryView = toolBar
        
        songURLTextField.delegate = self
        songURLTextField.attributedPlaceholder = NSAttributedString(string: "Paste a youtube address to override", attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.7233663201, green: 0.7233663201, blue: 0.7233663201, alpha: 1)])
        songURLTextField.inputAccessoryView = toolBar
        
        checkValidTitle()
        
        if songToEdit != nil {
            loadSongData()
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
    
    @IBAction func songOnDeckPressed(_ sender: Any) {
        if songOnDeckImage.image == #imageLiteral(resourceName: "Selected") {
            songOnDeckImage.image = #imageLiteral(resourceName: "NotSelected")
        } else {
            songOnDeckImage.image = #imageLiteral(resourceName: "Selected")
        }
    }
    
    @IBAction func songFavoriteButtonPressed(_ sender: Any) {
        if songFavorite.image == #imageLiteral(resourceName: "FavoriteFilled") {
            songFavorite.image = #imageLiteral(resourceName: "Favorite")
        } else {
            songFavorite.image = #imageLiteral(resourceName: "FavoriteFilled")
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        playClick()
        
        var song: Song!
        
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
        
        if songOnDeckImage.image == #imageLiteral(resourceName: "Selected") {
            removePreviouslySelected()
            song.selected = true
        } else {
            song.selected = false
        }
        
        if songFavorite.image == #imageLiteral(resourceName: "FavoriteFilled") {
            song.favorite = true
        } else {
            song.favorite = false
        }
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    func loadSongData() {
        if let song = songToEdit {
            songTopicTextField.text = song.topic
            songTitleTextField.text = song.title
            songBookTextField.text = song.book
            songNumberTextField.text = song.number
            songURLTextField.text = song.url
            let onDeck = song.selected
            let favorite = song.favorite
            if onDeck == true {
                songOnDeckImage.image = #imageLiteral(resourceName: "Selected")
            } else {
            songOnDeckImage.image = #imageLiteral(resourceName: "NotSelected")
            }
            if favorite == true {
                songFavorite.image = #imageLiteral(resourceName: "FavoriteFilled")
            } else {
                songFavorite.image = #imageLiteral(resourceName: "Favorite")
            }
            
            textFieldDidEndEditing(songTitleTextField)
        }
    }
    
    func removePreviouslySelected() {
        // 1) loop through all song entities and 2) make attribute "selected" = false
        // for eachIndex in Songs {
        //      eachIndex.selected = false
        //}
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        if songToEdit != nil {
            context.delete(songToEdit!)
            ad.saveContext()
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
}
