//
//  RuleVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import WebKit

class RuleVC: UIViewController {
    @IBOutlet weak var ruleCategoryLabel: UILabel!
    @IBOutlet weak var ruleMemberPhotoImage: UIImageView!
    @IBOutlet weak var ruleMemberNameLabel: UILabel!
    @IBOutlet weak var ruleTitleLabel: UILabel!
    @IBOutlet weak var ruleDetailLabel: UILabel!
    @IBOutlet weak var ruleWebKit: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://drive.google.com/file/d/0B7Bm33sKVSSqSnBFblFHUGU4NVk/view")
        let request = URLRequest(url: url!)
        
        ruleWebKit.load(request)
    }

    @IBAction func closeButtonPressed(_ sender: Any) {

        dismiss(animated: true, completion: nil)
    }
}
