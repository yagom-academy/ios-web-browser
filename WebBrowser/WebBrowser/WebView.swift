//
//  WebView.swift
//  WebBrowser
//
//  Created by 김호준 on 2020/11/10.
//

import UIKit
import WebKit

class WebView: WKWebView {
    
    @discardableResult func urlRequest(to url: String) -> Bool{
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
        //URLScheme를 확인 후 어떠한 URL에 대해 open함수를 실행시켜 유효한 URL값인지 체크를 해주는 함수 입니다.
        //Info.plist에 명시되지 않은 URL의 scheme나 디바이스에서 실행시킬 수 없는 URL의 scheme를 확인하여 리턴값을 결정해줍니다.
        //프로젝트에서 정규표현식만으로 처리가 가능하지만, URL의 유효성을 검사하는 방법을 찾던 와중에 찾았던 하나의 방법이라 추가를 해 뒀습니다.
        if !UIApplication.shared.canOpenURL(url) { return false }
        
        //정규표현식을 사용한 URL의 유효성 검사
        //스펙에서의 https://github.com 와 https://www.github.com 의 접속이 가능한 것을 확인하였습니다!
        let regularExpression = "((https|http)://)((\\w|-)+)(([.]|[/])((\\w|-)+))+"
        let predicate = NSPredicate(format: "SELF MATCHES %@", argumentArray: [regularExpression])
        return predicate.evaluate(with: string)
    }
}
