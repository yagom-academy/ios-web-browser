//
//  WebBrowser - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit
import WebKit

class ViewController: UIViewController, UISearchBarDelegate {
    // TODO: add indicator
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    private let myAddress = "https://www.indiepost.co.kr"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        searchBar.text = myAddress
        setWebView(url: myAddress)
    }

    
    func setWebView(url: String) {
        guard let setUrl = URL(string: url) else {
            return showErrorAlert()
        }
        
        let request = URLRequest(url: setUrl)
        webView.load(request)
    }
    
    func showErrorAlert() {
        let alert = UIAlertController(title: "오류", message: "url을 불러오는데 오류가 있습니다.", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(confirmAction)
        present(alert, animated: false, completion: nil)
    }
    
    @IBAction func moveToURL(_ sender: UIButton) {
        setWebView(url: searchBar.text ?? "")
    }
    
    @IBAction func goBackButton(_ sender: UIBarButtonItem) {
        webView.goBack()
    }
    
    @IBAction func goForwardButton(_ sender: UIBarButtonItem) {
        webView.goForward()
    }
    
    @IBAction func reloadButton(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    
}

