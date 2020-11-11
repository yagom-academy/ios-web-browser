//
//  WebBrowser - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit
import WebKit

// TODO: add indicator
class ViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    enum ErrorMessage : String {
        case convertUrl = "url로 변환하는데 문제가 있습니다."
        case moveForward = "앞으로 이동할 페이지가 없습니다."
        case moveBack = "뒤로 이동할 페이지가 없습니다."
        case loadPage = "페이지를 새로고침하는데 실패했습니다."
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setWebView()
    }
    
    func setWebView() {
        
        let startUrl = "https://www.indiepost.co.kr"
        guard let url = URL(string: startUrl) else {
            return showErrorAlert(error: .convertUrl)
        }
        
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    func showErrorAlert(error: ErrorMessage) {
        let alert = UIAlertController(title: nil, message: error.rawValue, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(confirmAction)
        present(alert, animated: false, completion: nil)
    }
    
    @IBAction func goBack() {
        if webView.canGoBack {
            webView.goBack()
        }
        else {
            showErrorAlert(error: .moveBack)
        }
    }
    
    @IBAction func goForward() {
        if webView.canGoForward {
            webView.goForward()
        }
        else {
            showErrorAlert(error: .moveForward)
        }
    }
    
    @IBAction func reloadPage() {
        
    }
    
    @IBAction func movePage() {
        
    }
}

