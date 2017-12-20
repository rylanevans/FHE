//
//  GameDetailsVC.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import CoreData

class GameDetailsVC: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var saveButton: BounceButton!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    @IBOutlet weak var hideSaveButton: UIImageView!
    @IBOutlet weak var gameTopicTextField: UITextField!
    @IBOutlet weak var gameTitleTextField: UITextField!
    @IBOutlet weak var gameBookTextField: UITextField!
    @IBOutlet weak var gameNumberTextField: UITextField!
    @IBOutlet weak var gameURLTextField: UITextField!
    @IBOutlet weak var gameOnDeckImage: UIImageView!
    @IBOutlet weak var gameFavorite: UIImageView!
    
    var gameBooks = gameBooksArray
    var gameTopics = lessonTopicsArray
    var gameToEdit: Game?
    var gameAssignment: Task?
    let gameTopicPicker = UIPickerView()
    let gameBookPicker = UIPickerView()
    
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
        
        gameTopicPicker.delegate = self
        gameTopicPicker.dataSource = self
        gameTopicPicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        gameBookPicker.delegate = self
        gameBookPicker.dataSource = self
        gameBookPicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        //        gameTopicTextField.delegate = self
        //        gameTopicTextField.attributedPlaceholder = NSAttributedString(string: "Select Topic", attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.7233663201, green: 0.7233663201, blue: 0.7233663201, alpha: 1)])
        //        gameTopicTextField.inputView = gameTopicPicker
        //        gameTopicPicker.tag = 1
        //        gameTopicTextField.inputAccessoryView = toolBar
        
        checkValidTitle()
        
        if gameToEdit != nil {
            loadGameData()
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
        let text = gameTitleTextField.text ?? ""
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
            let gameTopic = gameTopics[row]
            return gameTopic
        } else {
            let gameSource = gameBooks[row]
            return gameSource
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return gameTopics.count
        } else {
            return gameBooks.count
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            let gameTopic = gameTopics[row]
            gameTopicTextField.text = gameTopic
        } else {
            gameBookTextField.text = gameBooks[row]
        }
    }
    
    @IBAction func gameSelectedPressed(_ sender: Any) {
        if gameOnDeckImage.image == #imageLiteral(resourceName: "Selected") {
            gameOnDeckImage.image = #imageLiteral(resourceName: "NotSelected")
        } else {
            gameOnDeckImage.image = #imageLiteral(resourceName: "Selected")
        }
    }
    
    @IBAction func gameFavoriteButtonPressed(_ sender: Any) {
        if gameFavorite.image == #imageLiteral(resourceName: "FavoriteFilled") {
            gameFavorite.image = #imageLiteral(resourceName: "Favorite")
        } else {
            gameFavorite.image = #imageLiteral(resourceName: "FavoriteFilled")
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        playClick()
        
        var game: Game!
        
        if gameToEdit == nil {
            game = Game(context: context)
        } else {
            game = gameToEdit
        }
        
        if let topic = gameTopicTextField.text {
            game.topic = topic
        }
        
        if let book = gameBookTextField.text {
            game.book = book
        }
        
        if let title = gameTitleTextField.text {
            game.title = title
        }
        
        if gameNumberTextField.text != "" {
            let number = Int64(gameNumberTextField.text!)
            game.number = number!
        } else {
            let number = Int64(0)
            game.number = number
        }
        
        if let URL = gameURLTextField.text {
            game.url = URL
        }
        
        if gameOnDeckImage.image == #imageLiteral(resourceName: "Selected") {
            unselectEverything()
            game.selected = true
        } else {
            game.selected = false
        }
        
        if gameFavorite.image == #imageLiteral(resourceName: "FavoriteFilled") {
            game.favorite = true
        } else {
            game.favorite = false
        }
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    func loadGameData() {
        if let game = gameToEdit {
            gameTopicTextField.text = game.topic
            gameTitleTextField.text = game.title
            gameBookTextField.text = game.book
            gameNumberTextField.text = String(game.number)
            gameURLTextField.text = game.url
            let onDeck = game.selected
            let favorite = game.favorite
            if onDeck == true {
                gameOnDeckImage.image = #imageLiteral(resourceName: "Selected")
            } else {
                gameOnDeckImage.image = #imageLiteral(resourceName: "NotSelected")
            }
            if favorite == true {
                gameFavorite.image = #imageLiteral(resourceName: "FavoriteFilled")
            } else {
                gameFavorite.image = #imageLiteral(resourceName: "Favorite")
            }
            
            textFieldDidEndEditing(gameTitleTextField)
        }
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        deleteAlertMessage()
    }
    
    func deleteAlertMessage() {
        let alertController = UIAlertController(title: "⚠️ DELETE WARNING!", message: "Are you sure you want to delete this game?", preferredStyle: .alert)
        
        let deleteAction = UIAlertAction(title: "✗ Delete", style: .default, handler: {
            alert -> Void in
            
            self.deleteGame()
        })
        
        let cancelAction = UIAlertAction(title: "⌀ Cancel", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func deleteGame() {
        if gameToEdit != nil {
            let game = gameToEdit
            if game?.selected == true {
                unselectEverything()
            }
            context.delete(gameToEdit!)
            ad.saveContext()
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    func unselectEverything() {
        for eachGame in gamesArray {
            eachGame.selected = false
            eachGame.selectedOne = nil
            ad.saveContext()
        }
    }
}

