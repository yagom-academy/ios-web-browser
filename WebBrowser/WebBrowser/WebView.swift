//
//  WebView.swift
//  WebBrowser
//
//  Created by 김호준 on 2020/11/10.
//

import UIKit
import WebKit

class WebView: WKWebView {
    func urlRequest(to url: String) -> Bool{
        //Checking whether URL is Validate
        if checkURLValidate(url) {
            //Validate URL
            let myURL = URL(string: url)
            guard let urlToRequest = myURL else {fatalError("URL이 유효하지 않습니다!")}
            let createRequest = URLRequest(url: urlToRequest)
            self.load(createRequest)
            return true
        } else {
            //Invalidate URL
            return false
        }
    }
    private func checkURLValidate(_ string: String?) -> Bool {
        guard let unwrappingString = string,
              let url = URL(string: unwrappingString)
        else {return false}
        
        //url을 open할 수 없다면 false를 Return
        if !UIApplication.shared.canOpenURL(url) { return false }
        
        //정규표현식을 사용한 URL의 유효성 검사
        let regularExpression = "((https|http)://)((\\w|-)+)(([.]|[/])((\\w|-)+))+"
        let predicate = NSPredicate(format: "SELF MATCHES %@", argumentArray: [regularExpression])
        return predicate.evaluate(with: string)
    }
}
