//
//  MiscVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

class MisVC: UIViewController {
    @IBOutlet weak var miscMemberPhotoImage: UIImageView!
    @IBOutlet weak var miscMemberNameLabel: UILabel!
    @IBOutlet weak var miscTitleLabel: UILabel!
    @IBOutlet weak var miscDetailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clickSoundURL()
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        playClick()
        dismiss(animated: true, completion: nil)
    }
}
