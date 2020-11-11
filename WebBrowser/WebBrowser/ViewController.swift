//
//  WebBrowser - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var webViewMain: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 1. url string을 찾는다
        // 2. Request로 바꾼다
        // 3. load
        
        let urlString = "https://www.google.com"
        if let url = URL(string: urlString) { //unwrapping
            let urlReq = URLRequest(url: url)
            webViewMain.load(urlReq)
        }
       
    }


}

