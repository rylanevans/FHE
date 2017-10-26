//
//  AboutMeVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import UIKit
import StoreKit

class AboutMeVC: UIViewController {
    
    @IBAction func thankYouButtonPressed(_ sender: Any) {
        playClick()
        thankYou()
    }
    
    @IBAction func likeItButtonPressed(_ sender: Any) {
        playClick()
        likeIt()
    }
    
    @IBAction func loveItButtonPressed(_ sender: Any) {
        playClick()
        loveIt()
    }
    
    @IBAction func amazingButtonPressed(_ sender: Any) {
        playClick()
        amazing()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clickSoundURL()
        
        InAppPurchasesService.instance.delegate = self
        InAppPurchasesService.instance.loadProducts()
        
        NotificationCenter.default.addObserver(self, selector: #selector(handlePurchase(_ :)), name: NSNotification.Name(IAPServicePurchaseNotification), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleFailure), name: NSNotification.Name(IAPServiceFailureNotification), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func handlePurchase(_ notification: Notification) {
        guard let productID = notification.object as? String else { return }
        switch productID {
        case IAP_FHE_ID_thankYou:
            debugPrint("Purchase was made for $1.99")
            break
        default:
            break
        }
    }
    
    @objc func handleFailure() {
        print("Purchase Failed")
    }
    
    func thankYou() {
        InAppPurchasesService.instance.attemptPurchaseForItemWith(productIndex: .thankYou)
    }
    
    func likeIt() {
        InAppPurchasesService.instance.attemptPurchaseForItemWith(productIndex: .likeIt)
    }
    
    func loveIt() {
        InAppPurchasesService.instance.attemptPurchaseForItemWith(productIndex: .loveIt)
    }
    
    func amazing() {
        InAppPurchasesService.instance.attemptPurchaseForItemWith(productIndex: .amazing)
    }
    
    @IBAction func closeWindowPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension AboutMeVC: IAPServiceDelege {
    func iapProductsLoaded() {
        print("IAP Products loaded")
    }
}
