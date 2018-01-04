//
//  TutorialTVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import SafariServices

class TutorialTVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func videoTutorialsButtonPressed(_ sender: Any) {
        let URL = NSURL(string: "https://www.youtube.com/playlist?list=PLbuu8VeGQ5COhd6o3WYSzZ5nO9eBzexQF")!
        
        let videoTutorialsWebVC = SFSafariViewController(url: URL as URL)
        videoTutorialsWebVC.delegate = self
        
        present(videoTutorialsWebVC, animated: true, completion: nil)
    }
    
    @IBAction func orderAppleTVButtonPressed(_ sender: Any) {
        let id = "B075NCMLYL"
        let url = NSURL(string: "com.amazon.mobile.shopping.web://amazon.com/gp/product/\(id)")!
        if UIApplication.shared.canOpenURL(url as URL) == true {
            UIApplication.shared.open(url as URL, options: ["":""], completionHandler: nil)
        } else {
            let URL = NSURL(string: "https://www.amazon.com/gp/product/B075NCMLYL")!
            
            let amazonWebVC = SFSafariViewController(url: URL as URL)
            amazonWebVC.delegate = self
            
            present(amazonWebVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func orderHDMIButtonPressed(_ sender: Any) {
        let id = "B009WHV3BM"
        let url = NSURL(string: "com.amazon.mobile.shopping.web://amazon.com/gp/product/\(id)")!
        if UIApplication.shared.canOpenURL(url as URL) == true {
            UIApplication.shared.open(url as URL, options: ["":""], completionHandler: nil)
        } else {
            let URL = NSURL(string: "https://www.amazon.com/gp/product/B009WHV3BM")!
            
            let amazonWebVC = SFSafariViewController(url: URL as URL)
            amazonWebVC.delegate = self
            
            present(amazonWebVC, animated: true, completion: nil)
        }
    }
}

extension TutorialTVC: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
