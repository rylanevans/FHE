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
    @IBOutlet weak var ruleDetailsTextField: UITextView!
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
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.donePressedOnKeyboard))
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        
        ruleTitleTextField.inputAccessoryView = toolBar
        ruleDetailsTextField.inputAccessoryView = toolBar
        ruleURLTextField.inputAccessoryView = toolBar
        
        if ruleToEdit != nil {
            loadRuleData()
            checkValidTitle()
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
        let text = ruleTitleTextField.text
        let url = ruleURLTextField.text
        if (text?.isEmpty == false && url?.isEmpty == true) ||
             (text?.isEmpty == false && url?.isEmpty == false &&
                 (url?.hasPrefix("http://") == true || url?.hasPrefix("https://") == true || url?.hasPrefix("www.") == true) &&
                 (url?.contains("bing") != true && url?.contains("google") != true && url?.contains("yahoo") != true && url?.contains("duckduckgo") != true && url?.contains("wiki") != true && url?.contains("sex") != true && url?.contains("porn") != true && url?.contains("porno") != true && url?.contains("xxx") != true && url?.contains("redtube") != true && url?.contains("dailydot") != true)) {
            hideSaveButton.isHidden = true
            self.navigationItem.title = text
            saveButton.isEnabled = true
        } else {
            hideSaveButton.isHidden = false
            saveButton.isEnabled = false
            
            let alertController = UIAlertController(title: "⚠ WARNING!", message: "In order to enable save option, you need a “Title” and if you have a URL it must be a direct link to a website or youtube video.", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "✓ OK", style: .default, handler: {
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
            rule.alphabet = String(describing: title[(title.startIndex)])
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
            taskRule.selectedRule = rule
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
        let alertController = UIAlertController(title: "⚠ DELETE WARNING!", message: "Are you sure you want to delete this rule?", preferredStyle: .alert)
        
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

