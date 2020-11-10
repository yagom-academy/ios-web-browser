//
//  WebBrowser - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// 웹뷰에 구글 페이지 로드
        let urlString = "https://www.google.com"
        if let url = URL(string: urlString) {
            let urlReq = URLRequest(url: url)
            mainWebView.load(urlReq)
        }
       
    }

}

