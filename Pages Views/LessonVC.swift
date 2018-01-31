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
    @IBOutlet weak var buttonSpacer: UILabel!
    
    var lessonURL = "https://www.lds.org/?lang=eng"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPageData()
        
        let task = taskLesson
        if task.selectedLesson?.youTubeVideo == false {
            youTubeView.isHidden = true
            lessonDetailLabel.isHidden = false
            buttonDetailsView.isHidden = false
            buttonSpacer.isHidden = false
        } else {
            youTubeView.isHidden = false
            lessonDetailLabel.isHidden = true
            buttonDetailsView.isHidden = true
            buttonSpacer.isHidden = true
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        runTutorial()
    }
    
    func runTutorial() {
        if counter.lessonTip == false {
            counter.lessonTip = true
            ad.saveContext()
            let alertController = UIAlertController(title: "📌 TIPS & TRICKS", message: "\nTIP - Whoever is assigned the lesson can talk before or after sharing a video or visiting a URL with the planned lesson. Have a discussion, allow for questions, share thoughts, etc.", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "👌 Got it!", style: .default, handler: {
                (action : UIAlertAction!) -> Void in
            })
            
            alertController.addAction(okAction)
            alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
            
            self.present(alertController, animated: true, completion: nil)
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
            if task.detail != nil {
                lessonDetailLabel.text = task.detail
            }
            if task.url != nil && task.youTubeVideo == true {
                let url = (task.url?.components(separatedBy: "=")[1])!
                lessonURL = "https://www.youtube.com/embed/\(url)?rel=0&amp;controls=0&amp;showinfo=0"
            } else if task.url == nil || task.url == "" || task.url?.hasPrefix("https://") != true {
                lessonURL = "https://www.lds.org/?lang=eng"
            } else {
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

