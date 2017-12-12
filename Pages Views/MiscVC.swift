//
//  MiscVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import SafariServices

class MisVC: UIViewController {
    @IBOutlet weak var miscMemberPhotoImage: UIImageView!
    @IBOutlet weak var miscMemberNameLabel: UILabel!
    @IBOutlet weak var miscTitleLabel: UILabel!
    @IBOutlet weak var miscDetailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPageData()
    }
    
    @IBAction func detailsButtonPressed(_ sender: Any) {
        let URL = NSURL(string: "https://en.wiktionary.org/wiki/miscellaneous")!

        let miscWebVC = SFSafariViewController(url: URL as URL)
        miscWebVC.delegate = self
        
        present(miscWebVC, animated: true, completion: nil)
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func loadPageData() {
        let specificTask = taskMisc
        if let task = specificTask.selectedMisc {
            miscTitleLabel.text = task.title
            miscDetailLabel.text = task.detail
        }
        
        if let assignee = specificTask.assignment {
            miscMemberPhotoImage.image = assignee.photo as? UIImage
            miscMemberNameLabel.text = assignee.name
        }
    }
}

extension MisVC: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}

