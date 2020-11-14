//
//  WebBrowser - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit
import WebKit

final class ViewController: UIViewController {
    @IBOutlet private weak var webView: WKWebView!
    @IBOutlet private weak var URLInputField: UITextField!
    
    @IBAction private func moveButtonClicked(_ sender: UIButton) {
        guard let input = URLInputField.text else { return }
        guard let inputURL = URL(string: input) else { return }
        let request = URLRequest(url: inputURL)
        webView.load(request)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func backwardClicked(_ sender: UIBarButtonItem) {
        webView.goBack()
        if webView.canGoBack {
            sender.isEnabled = true
        } else {
            sender.isEnabled = false
        }
        
    }
    
    @IBAction private func forwardClicked(_ sender: UIBarButtonItem) {
        webView.goForward()
        if webView.canGoForward {
            sender.isEnabled = true
        } else {
            sender.isEnabled = false
        }
    }
    
    @IBAction private func reloadClicked(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    
}
