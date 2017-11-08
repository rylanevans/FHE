//
//  FHETVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/21/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import StoreKit

class FHETVC: UIViewController {
    
    @IBOutlet weak var christTeachingImage: UIImageView!
    @IBOutlet weak var backgroundShadow: UIView!
    @IBOutlet weak var segment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.clickSoundURL()
    }
    
    @IBAction func editButtonPressed(_ sender: Any) {
        playClick()
        self.tabBarController?.selectedIndex = 0
    }
    
    @IBAction func refreshAssignmentsButtonPressed(_ sender: Any) {
        playClick()
    }
    
    @IBAction func beginButtonPressed(_ sender: Any) {
        playClick()
//        let appReviewPresentedRandom = arc4random_uniform(4)
//        if appReviewPresentedRandom == UInt32(1) {
        if launchedCounter % 2 == 0 {
            SKStoreReviewController.requestReview()
        }
    }
    
    

    
    //    override func viewDidDisappear(_ animated: Bool) {
    //        super.viewDidDisappear(animated)
    //        self.tabBarController?.tabBar.isHidden = true
    //    }
    
    // MARK: - Table view data source
    
//        override func numberOfSections(in tableView: UITableView) -> Int {
//            return 0
//        }
//
//        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return 0
//        }
}

