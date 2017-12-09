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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPageData()
    }
    
    @IBAction func detailsButtonPressed(_ sender: Any) {
        //        playClick()
        let URL = NSURL(string: "https://www.ready.gov/build-a-kit")!
        let councilWebVC = SFSafariViewController(url: URL as URL)
        councilWebVC.delegate = self
        
        present(councilWebVC, animated: true, completion: nil)
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func loadPageData() {
        let specificTask = taskCouncil
        let task = specificTask.selectedCouncil
        let assignee = specificTask.assignment
        
        councilMemberPhotoImage.image = assignee?.photo as? UIImage
        councilMemberNameLabel.text = assignee?.name
        councilTitleLabel.text = task?.title
        councilDetailLabel.text = task?.detail
    }
}

extension CouncilVC: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
