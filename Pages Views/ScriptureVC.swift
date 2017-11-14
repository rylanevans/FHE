//
//  ScriptureVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/20/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import WebKit

class ScriptureVC: UIViewController {
    @IBOutlet weak var scriptureThemeLabel: UILabel!
    @IBOutlet weak var scriptureMemberPhotoImage: UIImageView!
    @IBOutlet weak var scriptureMemberNameLabel: UILabel!
    @IBOutlet weak var scriptureLocationLabel: UILabel!
    @IBOutlet weak var scriptureTitleLabel: UILabel!
    @IBOutlet weak var scriptureWebKit: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clickSoundURL()
        
        let url = URL(string: "https://www.lds.org/scriptures/ot/prov/3.5-6?lang=eng")
        let request = URLRequest(url: url!)
        
        scriptureWebKit.load(request)
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {

        dismiss(animated: true, completion: nil)
    }
}
