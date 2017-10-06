//
//  LessonVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/20/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import SafariServices

class LessonVC: UIViewController {
    @IBOutlet weak var lessonThemeLabel: UILabel!
    @IBOutlet weak var lessonMemberPhotoImage: UIImageView!
    @IBOutlet weak var lessonMemberNameLabel: UILabel!
    @IBOutlet weak var lessonTitleLabel: UILabel!
    @IBOutlet weak var lessonDetailLabel: UILabel!
    

    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

//let URL = NSURL(string: "https://www.lds.org/music/library/hymns/praise-to-the-man?lang=eng")!
//let songWebVC = SFSafariViewController(url: URL as URL)
//songWebVC.delegate = self
//
//present(songWebVC, animated: true, completion: nil)
//}
//
//
//extension SongVC: SFSafariViewControllerDelegate {
//    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
//        controller.dismiss(animated: true, completion: nil)
//    }
//}

