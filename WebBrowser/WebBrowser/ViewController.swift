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
        case emptyAddress = "이동하고 싶은 URL을 입력해주세요."
        case validateAddress = "입력한 주소가 올바른 형태가 아닙니다."
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setWebView()
    }
    
    func setUI() {
        searchBar.delegate = self
    }
    
    func setWebView() {
        let startUrl = "https://www.indiepost.co.kr"
        requestURL(urlString: startUrl)
    }
    
    func requestURL(urlString: String) {
        guard let url = URL(string: urlString) else {
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
        webView.reload()
    }
    
    @IBAction func movePage() {
        self.searchBar.endEditing(true)
        guard let urlString = searchBar.text,
              !urlString.isEmpty else {
            return self.showErrorAlert(error: .emptyAddress)
        }
        self.requestURL(urlString: urlString)
    }
}

extension ViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.movePage()
    }
}
