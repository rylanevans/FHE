//
//  ScriptureWebVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/16/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import WebKit

class ScriptureWebVC: UIViewController {
    
    @IBOutlet var scriptureWebView: UIView? = nil
    
    var webView: WKWebView?
    
    override func loadView() {
        super.loadView()
        self.webView = WKWebView()
        self.view = self.webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string: "https://www.lds.org/scriptures/bofm/2-ne/3.7?lang=eng#0")
        let myRequest = URLRequest(url: myURL!)
        _ = webView?.load(myRequest)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

