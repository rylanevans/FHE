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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func detailsButtonPressed(_ sender: Any) {
        //        playClick()
        let URL = NSURL(string: "https://media.giphy.com/media/l44QkVjrTiBgettq8/giphy.gif")!
        let thoughtWebVC = SFSafariViewController(url: URL as URL)
        thoughtWebVC.delegate = self
        
        present(thoughtWebVC, animated: true, completion: nil)
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {

        dismiss(animated: true, completion: nil)
    }
}

extension ThoughtVC: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
