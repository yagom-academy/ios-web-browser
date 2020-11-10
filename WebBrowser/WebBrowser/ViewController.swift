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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Configuration views
        webView.config()
        toolBar.config()
        
        //ToolBarDelegate
        toolBar.toolBarDelegate = self
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
