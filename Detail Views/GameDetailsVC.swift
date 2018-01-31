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
    @IBOutlet weak var gameCategoryTextField: UITextField!
    @IBOutlet weak var gameTitleTextField: UITextField!
    @IBOutlet weak var gameURLTextField: UITextField!
    @IBOutlet weak var gameOnDeckImage: UIImageView!
    @IBOutlet weak var gameFavorite: UIImageView!
    
    var gameCategory = gameCategoryArray
    var gameToEdit: Game?
    var gameAssignment: Task?
    let gameCategoryPicker = UIPickerView()
    
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
        
        gameCategoryPicker.delegate = self
        gameCategoryPicker.dataSource = self
        gameCategoryPicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        gameCategoryTextField.delegate = self
        gameCategoryTextField.inputView = gameCategoryPicker
        gameCategoryTextField.inputAccessoryView = toolBar
        
        gameTitleTextField.inputAccessoryView = toolBar
        gameURLTextField.inputAccessoryView = toolBar
        
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
        return
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
    
    func checkValidTitle() {
        let text = gameTitleTextField.text
        let url = gameURLTextField.text
        if (text?.isEmpty == false && url?.isEmpty == true) || (url?.isEmpty == false && url?.hasPrefix("https://") == true) {
            hideSaveButton.isHidden = true
            self.navigationItem.title = text
            saveButton.isEnabled = true
        } else {
            hideSaveButton.isHidden = false
            saveButton.isEnabled = false
            
            let alertController = UIAlertController(title: "⚠️ WARNING!", message: "In order to enable save option, you need a “Title” and if you have a URL it must include: “https://”.", preferredStyle: .alert)
            
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
        let gameTopic = gameCategory[row]
        return gameTopic
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gameCategory.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            let gameTopic = gameCategory[row]
            gameCategoryTextField.text = gameTopic
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
        
        if let category = gameCategoryTextField.text {
            game.category = category
        }
        
        if let title = gameTitleTextField.text {
            game.title = title
            game.alphabet = String(describing: title[(title.startIndex)])
        }
        
        if let URL = gameURLTextField.text {
            game.url = URL
        }
        
        if gameOnDeckImage.image == #imageLiteral(resourceName: "Selected") {
            unselectEverything()
            game.selected = true
            taskGame.selectedGame = game
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
            gameCategoryTextField.text = game.category
            gameTitleTextField.text = game.title
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

