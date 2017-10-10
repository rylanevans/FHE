//
//  FHETVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/21/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

class FHETVC: UIViewController {
    
    @IBOutlet weak var christTeachingImage: UIImageView!
    
    @IBOutlet weak var backgroundShadow: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.clickSoundURL()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        playClick()
    }
    
    @IBAction func beginButtonPressed(_ sender: Any) {
        
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

