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
    @IBOutlet weak var invalidURLLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        invalidURLLabel.isHidden = true
        
        guard let initialURL = URL(string: "https://m.naver.com ") else {
            print("URL is nil : 잘못된 값이 입력되었습니다.")
            invalidURLLabel.text = "잘못된 URL값 입니다."
            invalidURLLabel.isHidden = false
            return
        }
        
        loadWebView(of: initialURL)
        
        goBackButton.isEnabled = webView.canGoBack
        goForwardButton.isEnabled = webView.canGoForward
        
        webView.addObserver(self, forKeyPath: "loading", options: .new, context: nil)
        
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
        
        guard let requestedURL = URL(string: "https://"+requestedURLText) else {
            return
        }
        
        loadWebView(of: requestedURL)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if (keyPath == "loading") {
            goBackButton.isEnabled = webView.canGoBack
            goForwardButton.isEnabled = webView.canGoForward
        }
    }
}

extension ViewController {
    
    private func loadWebView(of requestedURL: URL) {
        let urlRequest = URLRequest(url: requestedURL)
        serachURLBar.text = requestedURL.absoluteString
        webView.load(urlRequest)
    }
    
}
