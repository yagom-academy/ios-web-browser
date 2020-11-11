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
    @IBOutlet weak var moveButton: UIButton!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var forwarkButton: UIBarButtonItem!
    @IBOutlet weak var reloadButton: UIBarButtonItem!
    
    private let myAddress = "https://www.indiepost.co.kr"

    override func viewDidLoad() {
        super.viewDidLoad()
        setWebView()
    }
    
    func setWebView() {
        guard let url = URL(string: myAddress) else {
            return showErrorAlert()
        }
        
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    func showErrorAlert() {
        let alert = UIAlertController(title: "오류", message: "url을 불러오는데 오류가 있습니다.", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(confirmAction)
        present(alert, animated: false, completion: nil)
    }
}

