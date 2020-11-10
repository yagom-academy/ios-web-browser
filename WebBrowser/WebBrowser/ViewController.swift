//
//  WebBrowser - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit
import WebKit
class ViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoLabel.isHidden = true
        
        guard let bookmarkURL = URL(string:"https://m.nate.com") else {
            infoLabel.isHidden = false
            infoLabel.text = "해당 주소URL을 찾을 수 없습니다."
            return
        }
       
        let urlRequest = URLRequest(url: bookmarkURL)
        webView.load(urlRequest)
    }
}
