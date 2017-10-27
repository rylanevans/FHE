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

    }
    
    @IBAction func detailsButtonPressed(_ sender: Any) {
        //        playClick()
        let URL = NSURL(string: "https://media.giphy.com/media/3o85xsGXVuYh8lM3EQ/giphy.gif")!
        let miscWebVC = SFSafariViewController(url: URL as URL)
        miscWebVC.delegate = self
        
        present(miscWebVC, animated: true, completion: nil)
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {

        dismiss(animated: true, completion: nil)
    }
}

extension MisVC: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}

