//
//  WebBrowser - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet var webView: WKWebView!
    private let myURL: URL? = URL(string: "https://www.github.com")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebView(URL: myURL)
    }
    
    /*
    우리조가 즐켜찾는 웹페이지 URL로 웹뷰를 로드시켜주는 함수
    code by jake,zziro
    */
    func loadWebView(URL: URL?) {
        guard let myURL = URL else { print("URL주소가 없어서 종료됩니다."); return }
        let myRequest = URLRequest(url: myURL)
        webView.load(myRequest)
    }

}

