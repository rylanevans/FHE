//
//  QuoteVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import SafariServices

class QuoteVC: UIViewController {
    @IBOutlet weak var quoteMemberPhotoImage: UIImageView!
    @IBOutlet weak var quoteMemberNameLabel: UILabel!
    @IBOutlet weak var quoteTitleLabel: UILabel!
    @IBOutlet weak var quoteDetailLabel: UILabel!
    
    var quoteURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPageData()
    }
    
    @IBAction func detailsButtonPressed(_ sender: Any) {
        let URL = NSURL(string: "\(quoteURL)")!
        let quoteWebVC = SFSafariViewController(url: URL as URL)
        quoteWebVC.delegate = self
        
        present(quoteWebVC, animated: true, completion: nil)
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func loadPageData() {
        let specificTask = taskQuote
        if let task = specificTask.selectedQuote {
            quoteTitleLabel.text = task.title
            quoteDetailLabel.text = task.detail
            
            if task.url == nil || task.url == "" {
                quoteURL = "https://www.pinterest.com/pin/42221315236979309/?lp=true"
            } else {
                quoteURL = task.url!
            }
        }
        
        if let assignee = specificTask.assignment {
            quoteMemberPhotoImage.image = assignee.photo as? UIImage
            quoteMemberNameLabel.text = assignee.name
        }
    }
}

extension QuoteVC: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
