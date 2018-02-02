//
//  CouncilVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import SafariServices

class CouncilVC: UIViewController {
    @IBOutlet weak var councilMemberPhotoImage: UIImageView!
    @IBOutlet weak var councilMemberNameLabel: UILabel!
    @IBOutlet weak var councilTitleLabel: UILabel!
    @IBOutlet weak var councilDetailLabel: UILabel!
    
    var councilURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPageData()
    }
    
    @IBAction func detailsButtonPressed(_ sender: Any) {
        let URL = NSURL(string: "\(councilURL)")!
        let councilWebVC = SFSafariViewController(url: URL as URL)
        councilWebVC.delegate = self
        
        present(councilWebVC, animated: true, completion: nil)
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func loadPageData() {
        let specificTask = taskCouncil
        if let task = specificTask.selectedCouncil {
            councilTitleLabel.text = task.title
            councilDetailLabel.text = task.detail
            
            if task.url == nil || task.url == "" {
                councilURL = "https://www.lds.org/blog/the-beginners-guide-to-family-councils?lang=eng"
            } else {
                councilURL = task.url!
            }
        }
        
        if let assignee = specificTask.assignment {
            councilMemberPhotoImage.image = assignee.photo as? UIImage
            councilMemberNameLabel.text = assignee.name
        }
    }
}

extension CouncilVC: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
