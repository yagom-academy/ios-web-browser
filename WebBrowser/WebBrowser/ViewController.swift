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
    @IBOutlet weak var searchBarURL: UISearchBar!
    @IBOutlet weak var moveToURLButton: UIButton!
    @IBOutlet weak var invalidURLLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBarURL.delegate = self
        webView.navigationDelegate = self
        invalidURLLabel.isHidden = true
        goBackButton.isEnabled = webView.canGoBack
        goForwardButton.isEnabled = webView.canGoBack
        
        let initialURLString = "https://m.naver.com"
        
        guard let initialURL = convertToURL(of: initialURLString) else {
            print("URL is nil : 잘못된 값이 입력되었습니다.")
            let notFoundURLAlert = UIAlertController(title: "Not Found", message: "입력한 주소가 올바른 형태가 아닙니다.", preferredStyle: .alert)
            let exitAction = UIAlertAction(title: "닫기", style: .default, handler: nil)
            notFoundURLAlert.addAction(exitAction)
            present(notFoundURLAlert,animated: false,completion: nil)
            return
        }
        //URL Request Check Function
        loadWebView(of: initialURL)
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
        guard let searchBarURLText = searchBarURL.text else {
            return
        }
        
        guard let requestedURL = convertToURL(of: searchBarURLText) else {
            print("URL is nil : 잘못된 값이 입력되었습니다.")
            let notFoundURLAlert = UIAlertController(title: "Not Found", message: "입력한 주소가 올바른 형태가 아닙니다.", preferredStyle: .alert)
            let exitAction = UIAlertAction(title: "닫기", style: .default, handler: nil)
            notFoundURLAlert.addAction(exitAction)
            present(notFoundURLAlert,animated: false,completion: nil)
            return
        }
        
        loadWebView(of: requestedURL)
    }
}
extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        goBackButton.isEnabled = webView.canGoBack
        goForwardButton.isEnabled = webView.canGoForward
        showCurrentAddress()
    }
}
extension ViewController: UISearchBarDelegate {
    private func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.becomeFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        tappedMoveToURLButton(moveToURLButton)
        searchBar.resignFirstResponder()
    }
}

extension ViewController {
    private func loadWebView(of requestedURL: URL) {
        let urlRequest = URLRequest(url: requestedURL)
        searchBarURL.text = requestedURL.absoluteString
        print(urlRequest)
        webView.load(urlRequest)
    }
    
    private func convertToURL(of searchBarText: String?) -> URL? {
        guard let requestedURLText = searchBarText, let testUrl = URL(string: requestedURLText) else {
            print("URL is nil : 잘못된 값이 입력되었습니다.")
            invalidURLLabel.text = "잘못된 URL값 입니다."
            invalidURLLabel.isHidden = false
            return nil
        }
        return testUrl
    }

    private func showCurrentAddress() {
        let currentAddress = webView.url
        searchBarURL.text = currentAddress?.absoluteString
    }
}
