//
//  PrayerVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

class OPrayerVC: UIViewController {
    @IBOutlet weak var prayerMemberPhotoImage: UIStackView!
    @IBOutlet weak var prayerMemberNameLabel: UILabel!
    @IBOutlet weak var prayerTitleLabel: UILabel!
    @IBOutlet weak var prayerDetailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clickSoundURL()
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        playClick()
        dismiss(animated: true, completion: nil)
    }
}
