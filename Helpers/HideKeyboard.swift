//
//  HideKeyboard.swift
//  FHE
//
//  Created by Rylan Evans on 10/9/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

extension UIViewController {
    
//    @objc func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        // Hide the keyboard.
//        textField.resignFirstResponder()
//        return true
//    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
