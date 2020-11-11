//
//  WebBrowser - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var urlEnteredTextField: UITextField!
    @IBOutlet weak var goButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let favoriteURL: String? = "https://www.github.com"
        loadWebPageToWebView(to: favoriteURL)
    }
    
    func convertStringToURL(input url: String?) -> URL? {
        guard let stringURL = url else { print("입력 URL이 없어서 종료됩니다."); return nil }
        let convertedURL: URL? = URL(string: stringURL)
        return convertedURL
    }
    
    func loadWebPageToWebView(to url: String?) {
        guard let requestedURL = convertStringToURL(input: url) else { print("변환된 URL이 존재하지 않습니다."); return }
        let request = URLRequest(url: requestedURL)
        webView.load(request)
    }
    
    @IBAction func goToEnteredURL(_ sender: UIButton) {
        guard let enteredURL = urlEnteredTextField?.text else { print("주소창에 입력된 주소가 없습니다."); return }
        loadWebPageToWebView(to: enteredURL)
    }
    
    @IBAction func goBack(_ sender: UIBarButtonItem) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction func goForward(_ sender: UIBarButtonItem) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @IBAction func reload(_ sender: UIBarButtonItem) {
        webView.reload()
    }

}

