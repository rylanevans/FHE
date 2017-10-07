//
//  FamilyDetailsVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/20/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

class FamilyDetailsVC: UIViewController {
    
    @IBOutlet weak var attendingMemberSwithTapped: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.clickSoundURL()
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
    
    @IBAction func saveMemberButtonPressed(_ sender: Any) {
        
        playClick()
    }
}

