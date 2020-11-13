//
//  UrlString.swift
//  WebBrowser
//
//  Created by Wonhee on 2020/11/13.
//

import Foundation

class UrlString : String {
}

extension UrlString {
    var isNotValidation: Bool {
        let validateAddressPrefixes = ["https://", "http://"]
        for validateAddress in validateAddressPrefixes where self.hasPrefix(validateAddress) {
            return false
        }
        return true
    }
}
