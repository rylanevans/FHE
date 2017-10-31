//
//  RuleVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import SafariServices

class RuleVC: UIViewController {
    @IBOutlet weak var ruleCategoryLabel: UILabel!
    @IBOutlet weak var ruleMemberPhotoImage: UIImageView!
    @IBOutlet weak var ruleMemberNameLabel: UILabel!
    @IBOutlet weak var ruleTitleLabel: UILabel!
    @IBOutlet weak var ruleDetailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func ruleDetailsPressed(_ sender: Any) {
        //        playClick()
        let URL = NSURL(string: "https://drive.google.com/file/d/0B7Bm33sKVSSqSnBFblFHUGU4NVk/view")!
        let ruleWebVC = SFSafariViewController(url: URL as URL)
        ruleWebVC.delegate = self
        
        present(thoughtWebVC, animated: true, completion: nil)
    }

    @IBAction func closeButtonPressed(_ sender: Any) {

        dismiss(animated: true, completion: nil)
    }
}

extension RuleVC: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
