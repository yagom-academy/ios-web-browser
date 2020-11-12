//
//  SearchBar.swift
//  WebBrowser
//
//  Created by 김호준 on 2020/11/10.
//

import UIKit

//A specialized view for receiving search-related information from the user.
//유저에게서 검색과 관련된 정보를 받는 것에 특화된 View이므로 UISearchBar를 사용.
class SearchBar: UISearchBar {
    func searchBarConfig() {
        //searchbar의 왼쪽 돋보기 icon 없애기!
        self.setImage(UIImage(), for: .search, state: .normal)
        self.autocapitalizationType = .none
        self.keyboardType = .URL
        self.textContentType = .URL
    }
}
