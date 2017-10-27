//
//  GameVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import SafariServices

class GameVC: UIViewController {
    @IBOutlet weak var gameThemeLabel: UILabel!
    @IBOutlet weak var gameMemberPhotoImage: UIImageView!
    @IBOutlet weak var gameMemberNameLabel: UILabel!
    @IBOutlet weak var gameTitleLabel: UILabel!
    @IBOutlet weak var gameDetailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func detailsButtonPressed(_ sender: Any) {
        //        playClick()
        let URL = NSURL(string: "https://en.wikipedia.org/wiki/Button,_button,_who%27s_got_the_button%3F")!
        let gameWebVC = SFSafariViewController(url: URL as URL)
        gameWebVC.delegate = self
        
        present(gameWebVC, animated: true, completion: nil)
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {

        dismiss(animated: true, completion: nil)
    }
}

extension GameVC: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
