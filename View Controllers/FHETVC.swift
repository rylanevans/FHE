//
//  FHETVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/21/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

class FHETVC: UITableViewController {
    
    @IBOutlet weak var christTeachingImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        christTeachingImage.semanticContentAttribute = .forceRightToLeft
    }
    
    func setCustomNavBar() {
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    //    override func viewDidDisappear(_ animated: Bool) {
    //        super.viewDidDisappear(animated)
    //        self.tabBarController?.tabBar.isHidden = true
    //    }
    
    // MARK: - Table view data source
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 0
//    }
}

