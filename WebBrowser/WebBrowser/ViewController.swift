//
//  WebBrowser - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let myURL = URL(string: "https://www.apple.com") else { return }
        let myRequest = URLRequest(url: myURL)
        webView.load(myRequest)
    }
}

