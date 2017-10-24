//
//  ScriptureVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/20/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import SafariServices

class ScriptureVC: UIViewController {
    @IBOutlet weak var scriptureThemeLabel: UILabel!
    @IBOutlet weak var scriptureMemberPhotoImage: UIImageView!
    @IBOutlet weak var scriptureMemberNameLabel: UILabel!
    @IBOutlet weak var scriptureLocationLabel: UILabel!
    @IBOutlet weak var scriptureTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clickSoundURL()
    }
    
    @IBAction func readScriptureButtonPressed(_ sender: Any) {
//        playClick()
        let URL = NSURL(string: "https://www.lds.org/scriptures/bofm/1-ne/3.7?lang=eng#6")!
        let scriptureWebVC = SFSafariViewController(url: URL as URL)
        scriptureWebVC.delegate = self
        
        present(scriptureWebVC, animated: true, completion: nil)
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {

        dismiss(animated: true, completion: nil)
    }
}

extension ScriptureVC: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}

