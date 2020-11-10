//
//  WebView.swift
//  WebBrowser
//
//  Created by 김호준 on 2020/11/10.
//

import UIKit
import WebKit

class WebView: WKWebView {
    public func config() {
        self.urlRequest(to: "https://www.apple.com")
    }
    public func urlRequest(to url: String) {
        let myURL = URL(string: url)
        guard let urlToRequest = myURL else {fatalError("URL이 유효하지 않습니다!")}
        let createRequest = URLRequest(url: urlToRequest)
        self.load(createRequest)
    }
}
