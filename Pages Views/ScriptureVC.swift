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
            
            var volume = ""
            if task.volume == "dc-testament" {
                volume = "DC"
            } else if task.volume != nil {
                volume = task.volume!
            }
            
            var book = ""
            if task.book == "dc" {
                book = ""
            } else if task.book != nil {
                book = task.book!
            }
            
            var chapterVerse = ""
            if task.verse == nil || task.verse == "" {
                chapterVerse = ""
            } else {
                chapterVerse = "\(task.chapter ?? "") : \(task.verse ?? "")"
            }
            
            scriptureTitleLabel.text = task.title?.capitalized
            scriptureDetailLabel.text = "\(volume.uppercased()) \(book.capitalized) \(chapterVerse)"
            
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
