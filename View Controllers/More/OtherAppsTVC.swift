//
//  OtherAppsTVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

class OtherAppsTVC: UIViewController {
    
    @IBAction func basketballSSTapped(_ sender: Any) {
        UIApplication.shared.openURL(NSURL(string: "https://itunes.apple.com/us/app/basketball-simple-stats/id1224378809?mt=8")! as URL)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
