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
    @IBOutlet weak var quoteDetailsTextField: UITextField!
    @IBOutlet weak var quoteURLTextField: UITextField!
    @IBOutlet weak var quoteOnDeckImage: UIImageView!
    @IBOutlet weak var quoteFavorite: UIImageView!
    
    var quoteToEdit: Quote?
    var quoteAssignment: Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.clickSoundURL()
        
        self.hideKeyboardWhenTappedAround()
        
        checkValidTitle()
        
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
        let text = quoteTitleTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
        if text.isEmpty != true {
            hideSaveButton.isHidden = true
        }
    }
    
    @objc func donePressedOnKeyboard() {
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
        }
        
        if let URL = quoteURLTextField.text {
            quote.url = URL
        }
        
        if quoteOnDeckImage.image == #imageLiteral(resourceName: "Selected") {
            unselectEverything()
            quote.selected = true
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
        let alertController = UIAlertController(title: "⚠️ DELETE WARNING!", message: "Are you sure you want to delete this quote?", preferredStyle: .alert)
        
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
