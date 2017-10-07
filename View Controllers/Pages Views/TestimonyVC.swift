//
//  TestimonyVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

class TestimonyVC: UIViewController {
    @IBOutlet weak var testimonyMemberPhotoImage: UIImageView!
    @IBOutlet weak var testimonyMemberNameLabel: UILabel!
    @IBOutlet weak var testimonyTitleLabel: UILabel!
    @IBOutlet weak var testimonyDetailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clickSoundURL()
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        playClick()
        dismiss(animated: true, completion: nil)
    }
}
