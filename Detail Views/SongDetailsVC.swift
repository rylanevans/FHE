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
    
    let songBooks = songBooksArray
    let songTopics = lessonTopicsArray
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
//        songTopicTextField.attributedPlaceholder = NSAttributedString(string: "Select Topic", attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.7233663201, green: 0.7233663201, blue: 0.7233663201, alpha: 1)])
        songTopicTextField.inputView = songTopicPicker
        songTopicPicker.tag = 1
        songTopicTextField.inputAccessoryView = toolBar
        
        songBookTextField.delegate = self
//        songBookTextField.attributedPlaceholder = NSAttributedString(string: "Select Topic", attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.7233663201, green: 0.7233663201, blue: 0.7233663201, alpha: 1)])
        songBookTextField.inputView = songBookPicker
        songBookTextField.inputAccessoryView = toolBar
        
        songTitleTextField.inputAccessoryView = toolBar
        songNumberTextField.inputAccessoryView = toolBar
        songURLTextField.inputAccessoryView = toolBar
        
        runTutorial()
        
        if songToEdit != nil {
            loadSongData()
        }
    }
    
    func runTutorial() {
        if counter.songDetailsTip == false {
            counter.songDetailsTip = true
            ad.saveContext()
            let alertController = UIAlertController(title: "📌 TIPS & TRICKS", message: "\nTRICK - Press the “Auto-Assign” button on the top to manually assign someone permanently. Otherwise leave it blank for auto-assign to work.\n\nTRICK - Select the desired section from the sort & filter bar to arrange which and how your songs will be displayed. Also, the “★” in the sort & filter bar means “favorites only”.\n\nTRICK - Type in the search bar to find a specific song.", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "👌 Got it!", style: .default, handler: {
                (action : UIAlertAction!) -> Void in
            })
            
            alertController.addAction(okAction)
            alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
        
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkValidTitle()
        return
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
    
    func checkValidTitle() {
        let text = songTitleTextField.text
        let url = songURLTextField.text
        if (text?.isEmpty == false && url?.isEmpty == true) || (url?.isEmpty == false && url?.hasPrefix("https://www.") == true) {
            hideSaveButton.isHidden = true
            self.navigationItem.title = text
            saveButton.isEnabled = true
        } else {
            hideSaveButton.isHidden = false
            saveButton.isEnabled = false
            
            let alertController = UIAlertController(title: "⚠️ WARNING!", message: "In order to enable save option, you need a “Title” and if you have a URL it must include: “https://www.”", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "👌 OK", style: .default, handler: {
                (action : UIAlertAction!) -> Void in
            })
            
            alertController.addAction(okAction)
            alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    @objc func donePressedOnKeyboard() {
        checkValidTitle()
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
    
    @IBAction func songSelectedPressed(_ sender: Any) {
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
            song.alphabet = String(describing: title[(title.startIndex)])
        }
        
        if songNumberTextField.text != "" {
            let number = Int64(songNumberTextField.text!)
            song.number = number!
        } else {
            let number = Int64(0)
            song.number = number
        }
        
        if let URL = songURLTextField.text {
            song.url = URL
        }
        
        if songOnDeckImage.image == #imageLiteral(resourceName: "Selected") {
            unselectEverything()
            song.selected = true
            taskSong.selectedSong = song
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
            songNumberTextField.text = String(song.number)
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
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        deleteAlertMessage()
    }
    
    func deleteAlertMessage() {
        let alertController = UIAlertController(title: "⚠️ DELETE WARNING!", message: "Are you sure you want to delete this song?", preferredStyle: .alert)
        
        let deleteAction = UIAlertAction(title: "✗ Delete", style: .default, handler: {
            alert -> Void in
            
            self.deleteSong()
        })
        
        let cancelAction = UIAlertAction(title: "⌀ Cancel", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func deleteSong() {
        if songToEdit != nil {
            let song = songToEdit
            if song?.selected == true {
                unselectEverything()
            }
            context.delete(songToEdit!)
            ad.saveContext()
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    func unselectEverything() {
        for eachSong in songsArray {
            eachSong.selected = false
            eachSong.selectedOne = nil
            ad.saveContext()
        }
    }
}
