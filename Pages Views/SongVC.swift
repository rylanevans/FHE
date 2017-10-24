//
//  SongVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/20/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import SafariServices

class SongVC: UIViewController {
    @IBOutlet weak var songThemeLabel: UILabel!
    @IBOutlet weak var songMemberPhotoImage: UIImageView!
    @IBOutlet weak var songMemberNameLabel: UILabel!
    @IBOutlet weak var songLocationLabel: UILabel!
    @IBOutlet weak var songDetailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clickSoundURL()
    }

    @IBAction func singSongPressed(_ sender: Any) {
//        playClick()
        let URL = NSURL(string: "https://www.lds.org/music/library/hymns/praise-to-the-man?lang=eng")!
        let songWebVC = SFSafariViewController(url: URL as URL)
        songWebVC.delegate = self
        
        present(songWebVC, animated: true, completion: nil)
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {

        dismiss(animated: true, completion: nil)
    }
}

extension SongVC: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
