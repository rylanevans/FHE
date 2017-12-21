//
//  RuleDetailsVC.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import CoreData

class RuleDetailsVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var saveButton: BounceButton!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    @IBOutlet weak var hideSaveButton: UIImageView!
    @IBOutlet weak var ruleTitleTextField: UITextField!
    @IBOutlet weak var ruleDetailsTextField: UITextField!
    @IBOutlet weak var ruleURLTextField: UITextField!
    @IBOutlet weak var ruleOnDeckImage: UIImageView!
    @IBOutlet weak var ruleFavorite: UIImageView!
    
    var ruleToEdit: Rule?
    var ruleAssignment: Task?
    
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
        
        if let title = ruleTitleTextField.text {
            rule.title = title
        }
        
        if let detail = ruleDetailsTextField.text {
            rule.detail = detail
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
            ruleTitleTextField.text = rule.title
            ruleDetailsTextField.text = rule.detail
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

