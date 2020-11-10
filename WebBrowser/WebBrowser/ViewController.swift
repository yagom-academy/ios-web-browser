//
//  WebBrowser - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet var webView: WebView!
    @IBOutlet var toolBar: ToolBar!
    
    //Strong일땐 naver가 안들어 가지는데 weak일대는 naver가 들어가진다?
    @IBOutlet weak var searchBar: SearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Configuration views
        webView.config()
        toolBar.config()
        searchBar.config()
        
        //ToolBarDelegate
        toolBar.toolBarDelegate = self
    }
    
    @IBAction func didTapSearchButton(_ sender: UIButton) {
        guard let urlToRequest = searchBar.text else {fatalError("URL이 유효하지 않습니다!")}
        print(urlToRequest)
        webView.urlRequest(to: urlToRequest)
    }
}

extension ViewController: ToolBarDelegate {
    func didTapBackButton() {
        webView.goBack()
    }
    
    func didTapForwardButton() {
        webView.goForward()
    }
    
    func didTapReloadButton() {
        webView.reload()
    }
}
