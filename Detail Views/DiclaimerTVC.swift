//
//  DiclaimerTVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

class DiclaimerTVC: UITableViewController {
    @IBOutlet weak var viewHeight: UIView!
    @IBOutlet weak var imageHeight: UIImageView!
    
    override func viewDidLoad() {
        let size = imageHeight.frame.size
        viewHeight.frame.size = size
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let size = imageHeight.frame.size
        viewHeight.frame.size = size
        tableView.reloadData()
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
