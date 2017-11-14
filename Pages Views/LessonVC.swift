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
    @IBOutlet weak var lessonThemeLabel: UILabel!
    @IBOutlet weak var lessonMemberPhotoImage: UIImageView!
    @IBOutlet weak var lessonMemberNameLabel: UILabel!
    @IBOutlet weak var lessonTitleLabel: UILabel!
    @IBOutlet weak var lessonDetailLabel: UILabel!
    @IBOutlet weak var lessonWebKit: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clickSoundURL()
        
        let url = URL(string: "https://www.youtube.com/embed/9MiF_HKoFr4?rel=0&amp;controls=0&amp;showinfo=0")
        let request = URLRequest(url: url!)
        
        lessonWebKit.load(request)
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {

        dismiss(animated: true, completion: nil)
    }
}

