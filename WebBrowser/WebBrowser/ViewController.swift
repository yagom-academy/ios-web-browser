//
//  WebBrowser - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit
import WebKit

class ViewController: UIViewController {
    // TODO: add indicator
    @IBOutlet weak var webView: WKWebView!
    
    private let myAddress = "https://www.indiepost.co.kr"

    override func viewDidLoad() {
        super.viewDidLoad()
        setWebView()
    }
    
    func setWebView() {
        guard let url = URL(string: myAddress) else {
            return makeErrorAlert()
        }
        
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    func makeErrorAlert() {
        let alert = UIAlertController(title: "오류", message: "url을 불러오는데 오류가 있습니다.", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(confirmAction)
        present(alert, animated: false, completion: nil)
    }
}

