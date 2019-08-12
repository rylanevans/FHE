//
//  ThoughtVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import SafariServices

class ThoughtVC: UIViewController {
    @IBOutlet weak var thoughtMemberPhotoImage: UIImageView!
    @IBOutlet weak var thoughtMemberNameLabel: UILabel!
    @IBOutlet weak var thoughtTitleLabel: UILabel!
    @IBOutlet weak var thoughtDetailLabel: UILabel!
    
    var thoughtURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPageData()
    }
    
    @IBAction func detailsButtonPressed(_ sender: Any) {
        let URL = NSURL(string: "\(thoughtURL)")!
        let thoughtWebVC = SFSafariViewController(url: URL as URL)
        thoughtWebVC.delegate = self
        
        present(thoughtWebVC, animated: true, completion: nil)
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func loadPageData() {
        let specificTask = taskThought
        if let task = specificTask.selectedThought {
            thoughtTitleLabel.text = task.title
            thoughtDetailLabel.text = task.detail
            
            if task.url == nil || task.url == "" {
                thoughtURL = "https://www.churchofjesuschrist.org/?lang=eng"
            } else {
                thoughtURL = task.url!
            }
        }
        
        if let assignee = specificTask.assignment {
            thoughtMemberPhotoImage.image = assignee.photo as? UIImage
            thoughtMemberNameLabel.text = assignee.name
        }
    }
}

extension ThoughtVC: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}

