//
//  LessonVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/20/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import SafariServices
import WebKit

class LessonVC: UIViewController {
    @IBOutlet weak var lessonMemberPhotoImage: UIImageView!
    @IBOutlet weak var lessonMemberNameLabel: UILabel!
    @IBOutlet weak var lessonTitleLabel: UILabel!
    @IBOutlet weak var lessonDetailLabel: UILabel!
    @IBOutlet weak var lessonWebKit: WKWebView!
    @IBOutlet weak var youTubeView: UIView!
    @IBOutlet weak var lessonDetailsView: UIStackView!
    @IBOutlet weak var buttonDetailsView: UIStackView!
    
    var lessonURL = "https://www.lds.org/?lang=eng"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPageData()
        
        let task = taskLesson
        if task.selectedLesson?.youTubeVideo == false {
            youTubeView.isHidden = true
            lessonDetailLabel.isHidden = false
            buttonDetailsView.isHidden = false
        }
    }
    
    
    @IBAction func detailsButtonPressed(_ sender: Any) {
        let URL = NSURL(string: "\(lessonURL)")!
        let treatWebVC = SFSafariViewController(url: URL as URL)
        treatWebVC.delegate = self
        
        present(treatWebVC, animated: true, completion: nil)
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func loadPageData() {
        let specificTask = taskLesson
        if let task = specificTask.selectedLesson {
            lessonTitleLabel.text = task.title
            lessonDetailLabel.text = task.detail
            let url = task.url?.suffix(11)
            if task.url != nil && task.youTubeVideo == true {
                lessonURL = "https://www.youtube.com/embed/\(url!)?rel=0&amp;controls=0&amp;showinfo=0"
            } else if task.url != nil {
                lessonURL = task.url!
            }
        }
        
        if let assignee = specificTask.assignment {
            lessonMemberPhotoImage.image = assignee.photo as? UIImage
            lessonMemberNameLabel.text = assignee.name
        }
        
        let URL = NSURL(string: "\(lessonURL)")!
        let request = URLRequest(url: URL as URL)
        
        lessonWebKit.load(request)
    }
}

extension LessonVC: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}

