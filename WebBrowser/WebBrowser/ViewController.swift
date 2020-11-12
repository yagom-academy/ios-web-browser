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
    
    //Strong일땐 naver가 안들어 가지는데 weak일대는 naver가 들어가진다? -> 잘들어가지네요!
    @IBOutlet var searchBar: SearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.urlRequest(to: "https://www.apple.com")
        
        //Configuration views
        searchBar.searchBarConfig()
        
        //ToolBarDelegate
        toolBar.toolBarDelegate = self
    }
    
    @IBAction func didTapSearchButton(_ sender: UIButton) {
        guard let urlToRequest = searchBar.text else {
            fatalError("URL이 유효하지 않습니다!")
        }
        webView.urlRequest(to: urlToRequest)
    }
}

extension ViewController: ToolBarDelegate {
    func didTapBackButton(toolBar: ToolBar) {
        webView.goBack()
    }
    
    func didTapForwardButton(toolBar: ToolBar) {
        webView.goForward()
    }
    
    func didTapReloadButton(toolBar: ToolBar) {
        webView.reload()
    }
}
