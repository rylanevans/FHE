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
    @IBOutlet weak var ruleMemberPhotoImage: UIImageView!
    @IBOutlet weak var ruleMemberNameLabel: UILabel!
    @IBOutlet weak var ruleTitleLabel: UILabel!
    @IBOutlet weak var ruleDetailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPageData()
    }
    
    @IBAction func ruleDetailsPressed(_ sender: Any) {
        let specificTask = taskRule
        let task = specificTask.selectedRule
        let url = URL(string: (task?.url)!)
//        let url = NSURL(string: "https://drive.google.com/file/d/0B7Bm33sKVSSqSnBFblFHUGU4NVk/view")!
        let ruleWebVC = SFSafariViewController(url: url! as URL)
        ruleWebVC.delegate = self
        
        present(ruleWebVC, animated: true, completion: nil)
    }

    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func loadPageData() {
        let specificTask = taskRule
        if let task = specificTask.selectedRule {
            ruleTitleLabel.text = task.title
            ruleDetailLabel.text = task.detail
        }
        
        if let assignee = specificTask.assignment {
            ruleMemberPhotoImage.image = assignee.photo as? UIImage
            ruleMemberNameLabel.text = assignee.name
        }
    }
}

extension RuleVC: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
