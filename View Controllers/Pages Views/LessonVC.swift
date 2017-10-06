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
    
    @IBAction func seeLessonButtonPressed(_ sender: Any) {
        let URL = NSURL(string: "https://www.youtube.com/playlist?list=PLbuu8VeGQ5CN5XZeSk8cUkHUpqKHaKYwP")!
        let lessonWebVC = SFSafariViewController(url: URL as URL)
        lessonWebVC.delegate = self
        
        present(lessonWebVC, animated: true, completion: nil)
    }

    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension LessonVC: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}

