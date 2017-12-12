//
//  TreatVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

class TreatVC: UIViewController {
    @IBOutlet weak var treatMemberPhotoImage: UIImageView!
    @IBOutlet weak var treatMemberNameLabel: UILabel!
    @IBOutlet weak var treatTitleLabel: UILabel!
    @IBOutlet weak var treatImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPageData()
    }
    
    @IBAction func closedButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func loadPageData() {
        let specificTask = taskTreat
        if let task = specificTask.selectedTreat {
            treatTitleLabel.text = task.title
        }
        
        if let assignee = specificTask.assignment {
            treatMemberPhotoImage.image = assignee.photo as? UIImage
            treatMemberNameLabel.text = assignee.name
        }
    }
}
