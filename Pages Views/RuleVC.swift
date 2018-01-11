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
    
    var ruleURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPageData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        runTutorial()
    }
    
    func runTutorial() {
        if counter.rulesTip == false {
            counter.rulesTip = true
            ad.saveContext()
            let alertController = UIAlertController(title: "📌 TIPS & TRICKS", message: "\nTIP - I suggest creating your own family rules using Google Docs. Once created, you can right click the Google Doc file to “get shareable link” and paste that in the URL for your custom rule(s). In my family, we have found reviewing rules regulary in our family meetings helps create better awareness, acceptance, and compliance.\n\nTIP - Press the “Details” button to see an example of family rules.", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "👌 Got it!", style: .default, handler: {
                (action : UIAlertAction!) -> Void in
            })
            
            alertController.addAction(okAction)
            alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func ruleDetailsPressed(_ sender: Any) {
        let URL = NSURL(string: "\(ruleURL)")!
        let ruleWebVC = SFSafariViewController(url: URL as URL)
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
            ruleURL = task.url ?? "https://drive.google.com/drive/my-drive"
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
