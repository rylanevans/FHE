//
//  QuoteDetailsVC.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import CoreData

class QuoteDetailsVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var saveButton: BounceButton!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    @IBOutlet weak var hideSaveButton: UIImageView!
    @IBOutlet weak var quoteTitleTextField: UITextField!
    @IBOutlet weak var quoteDetailsTextField: UITextView!
    @IBOutlet weak var quoteURLTextField: UITextField!
    @IBOutlet weak var quoteOnDeckImage: UIImageView!
    @IBOutlet weak var quoteFavorite: UIImageView!
    
    var quoteToEdit: Quote?
    var quoteAssignment: Task?
    
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
        
        quoteTitleTextField.inputAccessoryView = toolBar
        quoteDetailsTextField.inputAccessoryView = toolBar
        quoteURLTextField.inputAccessoryView = toolBar
        
        if quoteToEdit != nil {
            loadQuoteData()
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
        let text = quoteTitleTextField.text
        let url = quoteURLTextField.text
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
    
    @IBAction func quoteSelectedPressed(_ sender: Any) {
        if quoteOnDeckImage.image == #imageLiteral(resourceName: "Selected") {
            quoteOnDeckImage.image = #imageLiteral(resourceName: "NotSelected")
        } else {
            quoteOnDeckImage.image = #imageLiteral(resourceName: "Selected")
        }
    }
    
    @IBAction func quoteFavoriteButtonPressed(_ sender: Any) {
        if quoteFavorite.image == #imageLiteral(resourceName: "FavoriteFilled") {
            quoteFavorite.image = #imageLiteral(resourceName: "Favorite")
        } else {
            quoteFavorite.image = #imageLiteral(resourceName: "FavoriteFilled")
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        playClick()
        
        var quote: Quote!
        
        if quoteToEdit == nil {
            quote = Quote(context: context)
        } else {
            quote = quoteToEdit
        }
        
        if let detail = quoteDetailsTextField.text {
            quote.detail = detail
        }
        
        if let title = quoteTitleTextField.text {
            quote.title = title
            quote.alphabet = String(describing: title[(title.startIndex)])
        }
        
        if let URL = quoteURLTextField.text {
            quote.url = URL
        }
        
        if quoteOnDeckImage.image == #imageLiteral(resourceName: "Selected") {
            unselectEverything()
            quote.selected = true
            taskQuote.selectedQuote = quote
        } else {
            quote.selected = false
        }
        
        if quoteFavorite.image == #imageLiteral(resourceName: "FavoriteFilled") {
            quote.favorite = true
        } else {
            quote.favorite = false
        }
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    func loadQuoteData() {
        if let quote = quoteToEdit {
            quoteTitleTextField.text = quote.title
            quoteDetailsTextField.text = quote.detail
            quoteURLTextField.text = quote.url
            let onDeck = quote.selected
            let favorite = quote.favorite
            if onDeck == true {
                quoteOnDeckImage.image = #imageLiteral(resourceName: "Selected")
            } else {
                quoteOnDeckImage.image = #imageLiteral(resourceName: "NotSelected")
            }
            if favorite == true {
                quoteFavorite.image = #imageLiteral(resourceName: "FavoriteFilled")
            } else {
                quoteFavorite.image = #imageLiteral(resourceName: "Favorite")
            }
            
            textFieldDidEndEditing(quoteTitleTextField)
        }
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        deleteAlertMessage()
    }
    
    func deleteAlertMessage() {
        let alertController = UIAlertController(title: "⚠ DELETE WARNING!", message: "Are you sure you want to delete this quote?", preferredStyle: .alert)
        
        let deleteAction = UIAlertAction(title: "✗ Delete", style: .default, handler: {
            alert -> Void in
            
            self.deleteQuote()
        })
        
        let cancelAction = UIAlertAction(title: "⌀ Cancel", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func deleteQuote() {
        if quoteToEdit != nil {
            let quote = quoteToEdit
            if quote?.selected == true {
                unselectEverything()
            }
            context.delete(quoteToEdit!)
            ad.saveContext()
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    func unselectEverything() {
        for eachQuote in quotesArray {
            eachQuote.selected = false
            eachQuote.selectedOne = nil
            ad.saveContext()
        }
    }
}

