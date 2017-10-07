//
//  GameVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

class GameVC: UIViewController {
    @IBOutlet weak var gameThemeLabel: UILabel!
    @IBOutlet weak var gameMemberPhotoImage: UIImageView!
    @IBOutlet weak var gameMemberNameLabel: UILabel!
    @IBOutlet weak var gameTitleLabel: UILabel!
    @IBOutlet weak var gameDetailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clickSoundURL()
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        playClick()
        dismiss(animated: true, completion: nil)
    }
}
