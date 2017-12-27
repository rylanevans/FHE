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
    
    var scriptureURL = "https://www.lds.org/scriptures?lang=eng"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPageData()
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func loadPageData() {
        let specificTask = taskScripture
        
        if let assignee = specificTask.assignment {
            scriptureMemberPhotoImage.image = assignee.photo as? UIImage
            scriptureMemberNameLabel.text = assignee.name
        }
        
        if let task = specificTask.selectedScripture {
            scriptureTitleLabel.text = task.title?.capitalized
            scriptureDetailLabel.text = "\(task.volume?.uppercased() ?? "") \(task.book?.capitalized ?? "") \(task.chapter ?? ""):\(task.verse ?? "")"
            
            if task.volume != nil && task.book != nil && task.chapter != nil && task.verse != nil {
                let firstVerse = (task.verse?.components(separatedBy: "-")[0])!
                scriptureURL = "https://www.lds.org/scriptures/\(task.volume!)/\(task.book!)/\(task.chapter!).\(task.verse!)?lang=eng#\(firstVerse)"
                // scriptureURL pattern needs to follow this example = "https://www.lds.org/scriptures/ot/prov/3.5-6?lang=eng#5"
            }
            
            let URL = NSURL(string: scriptureURL)
            let request = URLRequest(url: URL! as URL)
            scriptureWebKit.load(request)
        }
    }
}
