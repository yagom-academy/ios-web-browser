//
//  WebBrowser - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebPageToWebView()
    }
    
    /*
    우리조가 즐켜찾는 웹페이지 URL로 웹뷰를 로드시켜주는 함수
    code by jake,zziro
    */
    func loadWebPageToWebView() {
        let favoriteURL: URL? = URL(string: "https://www.github.com")
        guard let URL = favoriteURL else { print("URL주소가 없어서 종료됩니다."); return }
        let myRequest = URLRequest(url: URL)
        webView.load(myRequest)
    }

}

