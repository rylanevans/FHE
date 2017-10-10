//
//  DiclaimerTVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

class DiclaimerTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
