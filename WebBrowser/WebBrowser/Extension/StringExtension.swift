//
//  StringExtension.swift
//  WebBrowser
//
//  Created by Wonhee on 2020/11/12.
//

import Foundation

extension String {
    var isNotEmpty: Bool {
        !self.isEmpty
    }
    
    var isNotValidation: Bool {
        let validateAddressPrefixes = ["https://", "http://"]
        for validateAddress in validateAddressPrefixes {
            if self.hasPrefix(validateAddress) { return true }
        }
        return true
    }
}
