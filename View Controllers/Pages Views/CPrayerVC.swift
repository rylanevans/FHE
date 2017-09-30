//
//  CPrayerVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/30/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

class CPrayerVC: UIViewController {
    @IBOutlet weak var prayerMemberPhotoImage: UIImage!
    @IBOutlet weak var prayerMemberNameLabel: UILabel!
    @IBOutlet weak var prayerTitleLabel: UILabel!
    @IBOutlet weak var prayerDetailLabel: UILabel!
    
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
