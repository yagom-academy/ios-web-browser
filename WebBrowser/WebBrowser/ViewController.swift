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
    
    func showAlert() {
        let alert = UIAlertController(title: "", message: "입력한 주소가 올바른 형태가 아닙니다", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "확인", style: .default){(action) in}
        alert.addAction(okAction)
        present(alert, animated: false, completion: nil)
    }
    
    func checkValid(address: String) -> Bool {
        let regEx = "((?:http|https)://)(?:www\\.)?[\\w\\d\\-_]+\\.\\w{2,3}(\\.\\w{2})?(/(?<=/)(?:[\\w\\d\\-./_]+)?)?"
        let predicate = NSPredicate(format: "SELF MATCHES %@", argumentArray: [regEx])
        return predicate.evaluate(with: address)
    }
    
    @IBAction func touchUpGoBarButtonItem(_ sender: UIBarButtonItem) {
         if let address = webPageAddressTextField.text {
            if checkValid(address: address) {
                    loadWebPage(of: address)
                    self.webPageAddressTextField.endEditing(true)
            } else {
                showAlert()
            }
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

