//
//  WebBrowser - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var mainWebView: WKWebView!
    @IBOutlet weak var webPageAddressTextField: UITextField!
    @IBOutlet weak var backBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var forwardBarButtonItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainWebView.navigationDelegate = self
        
        self.webPageAddressTextField.text = "https://www.google.com"
        self.loadWebPage(of: "https://www.google.com")
    }
    
    /// 웹뷰에 입력한 주소페이지를 로드하는 함수.
    ///
    /// - Parameter of: 이동할 웹페이지의 주소 문자열.
    func loadWebPage(of address: String) {
        if let url = URL(string: address) {
            let urlRequest = URLRequest(url: url)
            self.mainWebView.load(urlRequest)
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.backBarButtonItem.isEnabled = self.mainWebView.canGoBack
        self.forwardBarButtonItem.isEnabled = self.mainWebView.canGoForward
        
        self.webPageAddressTextField.text = self.mainWebView.url?.absoluteString
    }
    
    @IBAction func touchUpGoBarButtonItem(_ sender: UIBarButtonItem) {
        if let address = self.webPageAddressTextField.text {
            self.loadWebPage(of: address)
            
            self.webPageAddressTextField.endEditing(true)
        }
    }
    
    @IBAction func touchUpBackBarButtonItem(_ sender: UIBarButtonItem) {
        self.mainWebView.goBack()
    }
    
    @IBAction func touchUpForwardBarButtonItem(_ sender: UIBarButtonItem) {
        self.mainWebView.goForward()
    }
    
    @IBAction func touchUpRefreshBarButtonItem(_ sender: UIBarButtonItem) {
        self.mainWebView.reload()
    }

}

