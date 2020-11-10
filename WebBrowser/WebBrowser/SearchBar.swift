//
//  SearchBar.swift
//  WebBrowser
//
//  Created by 김호준 on 2020/11/10.
//

import UIKit

class SearchBar: UISearchBar {

    public func config() {
        //searchbar의 왼쪽 돋보기 icon 없애기!
        self.setImage(UIImage(), for: .search, state: .normal)
        self.autocapitalizationType = .none
        self.keyboardType = .URL
        self.textContentType = .URL
    }
}
