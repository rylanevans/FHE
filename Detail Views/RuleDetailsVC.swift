//
//  RuleDetailsVC.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import CoreData

class RuleDetailsVC: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var saveButton: BounceButton!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    @IBOutlet weak var hideSaveButton: UIImageView!
    @IBOutlet weak var ruleTopicTextField: UITextField!
    @IBOutlet weak var ruleTitleTextField: UITextField!
    @IBOutlet weak var ruleBookTextField: UITextField!
    @IBOutlet weak var ruleNumberTextField: UITextField!
    @IBOutlet weak var ruleURLTextField: UITextField!
    @IBOutlet weak var ruleOnDeckImage: UIImageView!
    @IBOutlet weak var ruleFavorite: UIImageView!
    
    var ruleBooks = ruleBooksArray
    var ruleTopics = lessonTopicsArray
    var ruleToEdit: Rule?
    var ruleAssignment: Task?
    let ruleTopicPicker = UIPickerView()
    let ruleBookPicker = UIPickerView()
    
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
        
        ruleTopicPicker.delegate = self
        ruleTopicPicker.dataSource = self
        ruleTopicPicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        ruleBookPicker.delegate = self
        ruleBookPicker.dataSource = self
        ruleBookPicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        //        ruleTopicTextField.delegate = self
        //        ruleTopicTextField.attributedPlaceholder = NSAttributedString(string: "Select Topic", attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.7233663201, green: 0.7233663201, blue: 0.7233663201, alpha: 1)])
        //        ruleTopicTextField.inputView = ruleTopicPicker
        //        ruleTopicPicker.tag = 1
        //        ruleTopicTextField.inputAccessoryView = toolBar
        
        checkValidTitle()
        
        if ruleToEdit != nil {
            loadRuleData()
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
        let text = ruleTitleTextField.text ?? ""
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
            let ruleTopic = ruleTopics[row]
            return ruleTopic
        } else {
            let ruleSource = ruleBooks[row]
            return ruleSource
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return ruleTopics.count
        } else {
            return ruleBooks.count
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            let ruleTopic = ruleTopics[row]
            ruleTopicTextField.text = ruleTopic
        } else {
            ruleBookTextField.text = ruleBooks[row]
        }
    }
    
    @IBAction func ruleSelectedPressed(_ sender: Any) {
        if ruleOnDeckImage.image == #imageLiteral(resourceName: "Selected") {
            ruleOnDeckImage.image = #imageLiteral(resourceName: "NotSelected")
        } else {
            ruleOnDeckImage.image = #imageLiteral(resourceName: "Selected")
        }
    }
    
    @IBAction func ruleFavoriteButtonPressed(_ sender: Any) {
        if ruleFavorite.image == #imageLiteral(resourceName: "FavoriteFilled") {
            ruleFavorite.image = #imageLiteral(resourceName: "Favorite")
        } else {
            ruleFavorite.image = #imageLiteral(resourceName: "FavoriteFilled")
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        playClick()
        
        var rule: Rule!
        
        if ruleToEdit == nil {
            rule = Rule(context: context)
        } else {
            rule = ruleToEdit
        }
        
        if let topic = ruleTopicTextField.text {
            rule.topic = topic
        }
        
        if let book = ruleBookTextField.text {
            rule.book = book
        }
        
        if let title = ruleTitleTextField.text {
            rule.title = title
        }
        
        if ruleNumberTextField.text != "" {
            let number = Int64(ruleNumberTextField.text!)
            rule.number = number!
        } else {
            let number = Int64(0)
            rule.number = number
        }
        
        if let URL = ruleURLTextField.text {
            rule.url = URL
        }
        
        if ruleOnDeckImage.image == #imageLiteral(resourceName: "Selected") {
            unselectEverything()
            rule.selected = true
        } else {
            rule.selected = false
        }
        
        if ruleFavorite.image == #imageLiteral(resourceName: "FavoriteFilled") {
            rule.favorite = true
        } else {
            rule.favorite = false
        }
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    func loadRuleData() {
        if let rule = ruleToEdit {
            ruleTopicTextField.text = rule.topic
            ruleTitleTextField.text = rule.title
            ruleBookTextField.text = rule.book
            ruleNumberTextField.text = String(rule.number)
            ruleURLTextField.text = rule.url
            let onDeck = rule.selected
            let favorite = rule.favorite
            if onDeck == true {
                ruleOnDeckImage.image = #imageLiteral(resourceName: "Selected")
            } else {
                ruleOnDeckImage.image = #imageLiteral(resourceName: "NotSelected")
            }
            if favorite == true {
                ruleFavorite.image = #imageLiteral(resourceName: "FavoriteFilled")
            } else {
                ruleFavorite.image = #imageLiteral(resourceName: "Favorite")
            }
            
            textFieldDidEndEditing(ruleTitleTextField)
        }
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        deleteAlertMessage()
    }
    
    func deleteAlertMessage() {
        let alertController = UIAlertController(title: "⚠️ DELETE WARNING!", message: "Are you sure you want to delete this rule?", preferredStyle: .alert)
        
        let deleteAction = UIAlertAction(title: "✗ Delete", style: .default, handler: {
            alert -> Void in
            
            self.deleteRule()
        })
        
        let cancelAction = UIAlertAction(title: "⌀ Cancel", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func deleteRule() {
        if ruleToEdit != nil {
            let rule = ruleToEdit
            if rule?.selected == true {
                unselectEverything()
            }
            context.delete(ruleToEdit!)
            ad.saveContext()
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    func unselectEverything() {
        for eachRule in rulesArray {
            eachRule.selected = false
            eachRule.selectedOne = nil
            ad.saveContext()
        }
    }
}

