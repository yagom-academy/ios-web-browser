//
//  WebBrowser - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var goBackButton: UIBarButtonItem!
    @IBOutlet weak var goForwardButton: UIBarButtonItem!
    @IBOutlet weak var reloadPageButton: UIBarButtonItem!
    @IBOutlet weak var serachURLBar: UISearchBar!
    @IBOutlet weak var moveToURLButton: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
        guard let initialURL = URL(string: "https://m.naver.com") else {
                    print("URL is nil : 잘못된 값이 입력되었습니다.")
                    return
        }
        
        loadURL(of: initialURL)

    }
    
    @IBAction func goBack() {
        
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction func goForward() {
        
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @IBAction func reloadPage() {
        
        webView.reload()
    }
        
    @IBAction func tappedMoveToURLButton(_ sender: UIButton) {
        
        guard let requestedURLText = serachURLBar.text else {
            return
        }
        
        guard let requestedURL = URL(string: "https://"+requestedURLText) else{
            return
        }
        
        loadURL(of: requestedURL)
    }
}

extension ViewController {
    
    private func loadURL(of requestedURL: URL){
        let urlRequest = URLRequest(url: requestedURL)
        serachURLBar.text = requestedURL.absoluteString
        webView.load(urlRequest)
    }
    
}
