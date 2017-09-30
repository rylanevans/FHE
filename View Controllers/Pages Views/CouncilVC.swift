//
//  CouncilVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

class CouncilVC: UIViewController {
    @IBOutlet weak var councilMemberPhotoImage: UIImageView!
    
    @IBOutlet weak var councilMemberNameLabel: UILabel!
    @IBOutlet weak var councilTitleLabel: UILabel!
    @IBOutlet weak var councilDetailLabel: UILabel!
    
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
