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
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
