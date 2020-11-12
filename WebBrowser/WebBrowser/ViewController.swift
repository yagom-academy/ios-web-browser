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
        let favoriteURL: String = "https://www.github.com"
        loadWebPageToWebView(to: favoriteURL)
    }
    
    func convertStringToUrl(input string: String?) -> URL? {
        guard let urlString = string else {
            showAlert(message: "입력 URL이 없어서 종료됩니다.")
            return nil
        }
        if isUrlStringValid(needCheck: urlString) {
            let convertedUrl: URL? = URL(string: urlString)
            return convertedUrl
        }
        else {
            showAlert(message: "입력하신 URL이 유효하지 않습니다.")
            return nil
        }
    }
    
    private func loadWebPageToWebView(to string: String?) {
        guard let requestedURL = convertStringToUrl(input: string) else {
            showAlert(message: "변환할 URL이 존재하지 않습니다.")
            return
        }
        let request = URLRequest(url: requestedURL)
        webView.load(request)
    }

    func isUrlStringValid(needCheck notCheckedUrl: String) -> Bool {
        let checkedUrl = notCheckedUrl.lowercased()
        if checkedUrl.hasPrefix("http://") || checkedUrl.hasPrefix("https://") {
            return true
        }
        return false
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func goToEnteredURL(_ sender: UIButton) {
        guard let enteredURL = urlEnteredTextField?.text else {
            showAlert(message: "주소창에 입력된 주소가 없습니다.")
            return
        }
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
