//
//  TestimonyVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

class TestimonyVC: UIViewController {
    @IBOutlet weak var testimonyMemberPhotoImage: UIImageView!
    @IBOutlet weak var testimonyMemberNameLabel: UILabel!
    @IBOutlet weak var testimonyTitleLabel: UILabel!
    @IBOutlet weak var testimonyDetailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPageData()
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func loadPageData() {
        let specificTask = taskTestimony
        let task = specificTask.selectedTestimony
        let assignee = specificTask.assignment
        
        testimonyMemberPhotoImage.image = assignee?.photo as? UIImage
        testimonyMemberNameLabel.text = assignee?.name
        testimonyTitleLabel.text = task?.title
        testimonyDetailLabel.text = task?.detail
    }
}
