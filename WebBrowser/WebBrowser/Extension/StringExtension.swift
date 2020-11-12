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
    
    var isNotValidate: Bool {
        let validateAddressPrefix = ["https://", "http://"]
        for validate in validateAddressPrefix {
            if self.hasPrefix(validate) { return true }
        }
        return true
    }
}
