//
//  WebBrowser - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainWebView: WKWebView!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var backBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var forwardBarButtonItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addressTextField.text = "https://www.google.com"
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
    
    @IBAction func touchUpGoBarButtonItme(_ sender: UIBarButtonItem) {
        if let address = addressTextField.text {
            loadWebPage(of: address)
            
            self.addressTextField.endEditing(true)
        }
    }
    
    @IBAction func touchUpBackBarButtonItme(_ sender: UIBarButtonItem) {
        mainWebView.goBack()
    }
    
    @IBAction func touchUpForwardBarButtonItme(_ sender: UIBarButtonItem) {
        mainWebView.goForward()
    }
    
    @IBAction func touchUpRefreshBarButtonItem(_ sender: UIBarButtonItem) {
        mainWebView.reload()
    }

}

