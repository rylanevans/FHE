//
//  SongWebVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/15/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import WebKit

class SongWebVC: UIViewController {
    
    @IBOutlet var songWebView: UIView? = nil
    
    var webView: WKWebView?
    
    override func loadView() {
        super.loadView()
        self.webView = WKWebView()
        self.view = self.webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string: "https://www.lds.org/music/library/hymns/praise-to-the-man?lang=eng")
        let myRequest = URLRequest(url: myURL!)
        _ = webView?.load(myRequest)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
