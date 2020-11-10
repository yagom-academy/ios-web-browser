//
//  WebBrowser - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var webVeiw: WKWebView!
    @IBOutlet weak var goBackButton: UIBarButtonItem!
    @IBOutlet weak var goForwardButton: UIBarButtonItem!
    @IBOutlet weak var reloadPageButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        guard let initialURL = URL(string: "https://m.naver.com") else {
                    print("URL is nil : 잘못된 값이 입력되었습니다.")
                    return
        }
        
        let urlRequest = URLRequest(url: initialURL)
        webVeiw.load(urlRequest)

    }
    
    @IBAction func goBack() {
        
        if webVeiw.canGoBack {
            webVeiw.goBack()
        }
    }
    
    @IBAction func goForward() {
        
        if webVeiw.canGoForward {
            webVeiw.goForward()
        }
    }
    
    @IBAction func reloadPage() {
        
        webVeiw.reload()
    }
}
