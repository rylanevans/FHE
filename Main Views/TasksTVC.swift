//
//  PrepareTVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/20/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import StoreKit

class TasksTVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0, green: 0.4755483866, blue: 0.9911283851, alpha: 1),
            NSAttributedStringKey.font: UIFont(name: "Noteworthy-Bold", size: 35)!
        ]
        print("Test")
        
        clickSoundURL()
        
        InAppPurchasesService.instance.delegate = self
        InAppPurchasesService.instance.loadProducts()
        
        NotificationCenter.default.addObserver(self, selector: #selector(handlePurchase(_ :)), name: NSNotification.Name(IAPServicePurchaseNotification), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleFailure), name: NSNotification.Name(IAPServiceFailureNotification), object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let presentRandom = arc4random_uniform(5)
        if presentRandom == UInt32(1) {
        performSegue(withIdentifier: "AboutMe", sender: nil)
        }
    }
    
    //    func toggleSwitch() {
    //        if (sender.isOn == true) {
    //            output.text = "Yes! It is on."
    //        } else {
    //            output.text = "No. It is off."
    //        }
    //    }
    
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
    
    func likeIt() {
        InAppPurchasesService.instance.attemptPurchaseForItemWith(productIndex: .likeIt)
    }
}

extension TasksTVC: IAPServiceDelege {
    func iapProductsLoaded() {
        print("IAP Products loaded")
    }
}


// MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 0
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 0
//    }
