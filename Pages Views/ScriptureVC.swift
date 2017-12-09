//
//  ScriptureVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/20/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import WebKit

class ScriptureVC: UIViewController {
    @IBOutlet weak var scriptureMemberPhotoImage: UIImageView!
    @IBOutlet weak var scriptureMemberNameLabel: UILabel!
    @IBOutlet weak var scriptureTitleLabel: UILabel!
    @IBOutlet weak var scriptureDetailLabel: UILabel!
    @IBOutlet weak var scriptureWebKit: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPageData()
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func loadPageData() {
        let specificTask = taskScripture
        let task = specificTask.selectedScripture
        let assignee = specificTask.assignment
        
        scriptureMemberPhotoImage.image = assignee?.photo as? UIImage
        scriptureMemberNameLabel.text = assignee?.name
        scriptureTitleLabel.text = task?.title
        scriptureDetailLabel.text = "\(task?.volume) \(task?.book) \(task?.chapter) \(task?.verse)"
        
        //        let url = URL(string: "https://www.lds.org/scriptures/ot/prov/3.5-6?lang=eng#5")
        let url = URL(string: "https://www.lds.org/scriptures/ot/prov/3.5-6?lang=eng#5")
        let request = URLRequest(url: url!)
        
        scriptureWebKit.load(request)
    }
}
