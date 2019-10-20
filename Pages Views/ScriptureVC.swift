//
//  ScriptureVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/20/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import WebKit

class ScriptureVC: UIViewController, WKNavigationDelegate {
    
    // MARK: - Custom Variables
    
    @IBOutlet weak var scriptureMemberPhotoImage: UIImageView!
    @IBOutlet weak var scriptureMemberNameLabel: UILabel!
    @IBOutlet weak var scriptureTitleLabel: UILabel!
    @IBOutlet weak var scriptureDetailLabel: UILabel!
    @IBOutlet weak var scriptureWebKit: WKWebView!
    
    var scriptureURL = "https://www.churchofjesuschrist.org/scriptures?lang=eng"
    
    // MARK: - View Controller Lifecycle
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Testing Alternative
        scriptureWebKit.navigationDelegate = self
        loadPageData()
        scriptureWebSite(htmlString: scriptureURL)
    }
    
    // MARK: - Interface Builder Methods
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Load Content
    
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
            let chapter = String(task.chapter)
            
            if task.verse == nil || task.verse == "" {
                chapterVerse = ""
            } else {
                chapterVerse = "\(chapter) : \(task.verse ?? "")"
            }
            
            scriptureTitleLabel.text = task.title?.capitalized
            scriptureDetailLabel.text = "\(volume.uppercased()) \(book.capitalized) \(chapterVerse)"
            
            if task.volume != nil && task.book != nil && task.verse != nil {
                let firstVerse = (task.verse?.components(separatedBy: "-")[0])!
                let chapter = String(task.chapter)
                scriptureURL = "https://www.churchofjesuschrist.org/scriptures/\(task.volume!)/\(task.book!)/\(chapter).\(task.verse!)?lang=eng#\(firstVerse)"
                // scriptureURL pattern needs to follow this example = "https://www.churchofjesuschrist.org/scriptures/ot/prov/3.5-6?lang=eng#5"
            }
            
//            let URL = NSURL(string: scriptureURL)
//            let request = URLRequest(url: URL! as URL)
//            scriptureWebKit.load(request)
            
        }
    }
    
    // MARK: - Test WKNavigationDelegate
    
    func scriptureWebSite(htmlString: String) {
        let url = URL (string: htmlString)
        let request = URLRequest(url: url!)
        scriptureWebKit.load(request)
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Start to load")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("finish to load")
        //        let elementID = "app"
        //        let headerNav = "contentHead-3F0ox"
        //        let footerNav = "mobileNav-1qobD"
        let removeElementIdScript = """
        var els = document.getElementsByClassName('mobileNav-1qobD');
        removeClass(els, 'mobileNav-1qobD');
        addClass(els, 'new-class-name');

        var el = document.getElementById('app');
        removeClass([el], 'mobileNav-1qobD');
        addClass([el], 'new-class-name');

        function addClass(elements, className) {
            for (var i = 0; i < elements.length; i++) {
                var element = elements[i];
                if (element.classList) {
                    element.classList.add(className);
                } else {
                    element.className += ' ' + className;
                }
            }
        }

        function removeClass(elements, className) {
            for (var i = 0; i < elements.length; i++) {
                var element = elements[i];
                if (element.classList) {
                    element.classList.remove(className);
                } else {
                    element.className = element.className.replace(new RegExp('(^|\\b)' + className.split(' ').join('|') + '(\\b|$)', 'gi'), ' ');
                }
            }
        }

        var els1 = document.getElementsByClassName('contentHead-3F0ox');
        removeClass1(els1, 'contentHead-3F0ox');
        addClass1(els1, 'new-class-name');

        var el1 = document.getElementById('app');
        removeClass1([el1], 'contentHead-3F0ox');
        addClass1([el1], 'new-class-name');

        function addClass1(elements, className) {
            for (var i = 0; i < elements.length; i++) {
                var element = elements[i];
                if (element.classList) {
                    element.classList.add(className);
                } else {
                    element.className += ' ' + className;
                }
            }
        }

        function removeClass1(elements, className) {
            for (var i = 0; i < elements.length; i++) {
                var element = elements[i];
                if (element.classList) {
                    element.classList.remove(className);
                } else {
                    element.className = element.className.replace(new RegExp('(^|\\b)' + className.split(' ').join('|') + '(\\b|$)', 'gi'), ' ');
                }
            }
        }
"""
        webView.evaluateJavaScript(removeElementIdScript) { (response, error) in
            debugPrint("Confrim that it worked")
            print(removeElementIdScript)
        }
    }
}
