//
//  TreatDetailsVC.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import CoreData

class TreatDetailsVC: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var saveButton: BounceButton!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    @IBOutlet weak var hideSaveButton: UIImageView!
    @IBOutlet weak var treatCategoryTextField: UITextField!
    @IBOutlet weak var treatTitleTextField: UITextField!
    @IBOutlet weak var treatURLTextField: UITextField!
    @IBOutlet weak var treatOnDeckImage: UIImageView!
    @IBOutlet weak var treatFavorite: UIImageView!
    
    var treatCategory = treatsCategoryArray
    var treatToEdit: Treat?
    var treatAssignment: Task?
    let treatCategoryPicker = UIPickerView()
    
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
        
        treatCategoryPicker.delegate = self
        treatCategoryPicker.dataSource = self
        treatCategoryPicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        treatCategoryTextField.delegate = self
        treatCategoryTextField.inputView = treatCategoryPicker
        treatCategoryTextField.inputAccessoryView = toolBar
        
        treatTitleTextField.inputAccessoryView = toolBar
        treatURLTextField.inputAccessoryView = toolBar
        
        checkValidTitle()
        
        if treatToEdit != nil {
            loadTreatData()
        }
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkValidTitle()
        navigationItem.title = textField.text
        return
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
    
    func checkValidTitle() {
        let text = treatTitleTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
        if text.isEmpty != true {
            hideSaveButton.isHidden = true
        }
    }
    
    @objc func donePressedOnKeyboard() {
        view.endEditing(true)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let treat = treatCategory[row]
        return treat
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return treatCategory.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let treat = treatCategory[row]
        treatCategoryTextField.text = treat
    }
    
    @IBAction func treatSelectedPressed(_ sender: Any) {
        if treatOnDeckImage.image == #imageLiteral(resourceName: "Selected") {
            treatOnDeckImage.image = #imageLiteral(resourceName: "NotSelected")
        } else {
            treatOnDeckImage.image = #imageLiteral(resourceName: "Selected")
        }
    }
    
    @IBAction func treatFavoriteButtonPressed(_ sender: Any) {
        if treatFavorite.image == #imageLiteral(resourceName: "FavoriteFilled") {
            treatFavorite.image = #imageLiteral(resourceName: "Favorite")
        } else {
            treatFavorite.image = #imageLiteral(resourceName: "FavoriteFilled")
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        playClick()
        
        var treat: Treat!
        
        if treatToEdit == nil {
            treat = Treat(context: context)
        } else {
            treat = treatToEdit
        }
        
        if let category = treatCategoryTextField.text {
            treat.category = category
        }
        
        if let title = treatTitleTextField.text {
            treat.title = title
        }
        
        if let URL = treatURLTextField.text {
            treat.url = URL
        }
        
        if treatOnDeckImage.image == #imageLiteral(resourceName: "Selected") {
            unselectEverything()
            treat.selected = true
        } else {
            treat.selected = false
        }
        
        if treatFavorite.image == #imageLiteral(resourceName: "FavoriteFilled") {
            treat.favorite = true
        } else {
            treat.favorite = false
        }
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    func loadTreatData() {
        if let treat = treatToEdit {
            treatCategoryTextField.text = treat.category
            treatTitleTextField.text = treat.title
            treatURLTextField.text = treat.url
            let onDeck = treat.selected
            let favorite = treat.favorite
            if onDeck == true {
                treatOnDeckImage.image = #imageLiteral(resourceName: "Selected")
            } else {
                treatOnDeckImage.image = #imageLiteral(resourceName: "NotSelected")
            }
            if favorite == true {
                treatFavorite.image = #imageLiteral(resourceName: "FavoriteFilled")
            } else {
                treatFavorite.image = #imageLiteral(resourceName: "Favorite")
            }
            
            textFieldDidEndEditing(treatTitleTextField)
        }
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        deleteAlertMessage()
    }
    
    func deleteAlertMessage() {
        let alertController = UIAlertController(title: "⚠️ DELETE WARNING!", message: "Are you sure you want to delete this treat?", preferredStyle: .alert)
        
        let deleteAction = UIAlertAction(title: "✗ Delete", style: .default, handler: {
            alert -> Void in
            
            self.deleteTreat()
        })
        
        let cancelAction = UIAlertAction(title: "⌀ Cancel", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func deleteTreat() {
        if treatToEdit != nil {
            let treat = treatToEdit
            if treat?.selected == true {
                unselectEverything()
            }
            context.delete(treatToEdit!)
            ad.saveContext()
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    func unselectEverything() {
        for eachTreat in treatsArray {
            eachTreat.selected = false
            eachTreat.selectedOne = nil
            ad.saveContext()
        }
    }
}

