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
    
    @IBAction func orderButtonPressed(_ sender: Any) {
        let URL = NSURL(string: "https://www.amazon.com/Apple-Lightning-Digital-Adapter-MD826AM/dp/B009WHV3BM/")!
        
        let amazonWebVC = SFSafariViewController(url: URL as URL)
        amazonWebVC.delegate = self
        
        present(amazonWebVC, animated: true, completion: nil)
    }
        
    // MARK: - Table view data source
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 0
//    }
//    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
}

extension TutorialTVC: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
