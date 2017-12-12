//
//  SpotlightVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

class SpotlightVC: UIViewController {
    @IBOutlet weak var spotlightMemberPhotoImage: UIImageView!
    @IBOutlet weak var spotlightMemberNameLabel: UILabel!
    @IBOutlet weak var spotlightTitleLabel: UILabel!
    @IBOutlet weak var spotlightDetailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPageData()
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {

        dismiss(animated: true, completion: nil)
    }
    
    func loadPageData() {
        let specificTask = taskSpotlight
        if let task = specificTask.selectedSpotlight {
            spotlightTitleLabel.text = task.title
            spotlightDetailLabel.text = task.detail
        }
        
        if let assignee = specificTask.assignment {
            spotlightMemberPhotoImage.image = assignee.photo as? UIImage
            spotlightMemberNameLabel.text = assignee.name
        }
    }
}
