//
//  ScriptureVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/20/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

class ScriptureVC: UIViewController {
    @IBOutlet weak var scriptureThemeLabel: UILabel!
    @IBOutlet weak var scriptureMemberPhotoImage: UIImageView!
    @IBOutlet weak var scriptureMemberNameLabel: UILabel!
    @IBOutlet weak var scriptureLocationLabel: UILabel!
    @IBOutlet weak var scriptureTitleLabel: UILabel!
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
