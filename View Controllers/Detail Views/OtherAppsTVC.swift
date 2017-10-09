//
//  OtherAppsTVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

class OtherAppsTVC: UITableViewController {
    
    @IBOutlet weak var tableCell: UIView!
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.playClick()
        
        let indexPath = indexPath.row
        
        if indexPath == 0 {
            basketballSSTapped()
        }
    }
    
    func basketballSSTapped() {
        
        UIApplication.shared.open(NSURL(string: "https://itunes.apple.com/us/app/basketball-simple-stats/id1224378809?mt=8")! as URL, options: ["":""], completionHandler: nil)
        
//        UIApplication.shared.openURL(NSURL(string: "https://itunes.apple.com/us/app/basketball-simple-stats/id1224378809?mt=8")! as URL)
        
//        UIApplication.shared.open(NSURL("https://itunes.apple.com/us/app/basketball-simple-stats/id1224378809?mt=8") as URL, options: [:], completionHandler: nil)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clickSoundURL()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.isMovingToParentViewController {
            playClick()
        }
    }
    
    override func viewWillDisappear(_ animated : Bool) {
        super.viewWillDisappear(animated)
        if self.isMovingFromParentViewController {
            playClick()
        }
    }
}