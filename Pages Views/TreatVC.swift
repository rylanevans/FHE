//
//  TreatVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import SafariServices

class TreatVC: UIViewController {
    @IBOutlet weak var treatMemberPhotoImage: UIImageView!
    @IBOutlet weak var treatMemberNameLabel: UILabel!
    @IBOutlet weak var treatTitleLabel: UILabel!
    @IBOutlet weak var treatImage: UIImageView!
    
    var treatURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPageData()
    }
    
    @IBAction func detailsButtonPressed(_ sender: Any) {
        let URL = NSURL(string: "\(treatURL)")!
        let treatWebVC = SFSafariViewController(url: URL as URL)
        treatWebVC.delegate = self
        
        present(treatWebVC, animated: true, completion: nil)
    }
    
    @IBAction func closedButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func loadPageData() {
        let specificTask = taskTreat
        if let task = specificTask.selectedTreat {
            treatTitleLabel.text = task.title
            treatURL = task.url ?? "https://www.pinterest.com/search/pins/?q=treats"
        }
        
        if let assignee = specificTask.assignment {
            treatMemberPhotoImage.image = assignee.photo as? UIImage
            treatMemberNameLabel.text = assignee.name
        }
    }
}

extension TreatVC: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
