//
//  ToolBar.swift
//  WebBrowser
//
//  Created by 김호준 on 2020/11/10.
//

import UIKit

protocol ToolBarDelegate: AnyObject {
    func didTapBackButton()
    func didTapForwardButton()
    func didTapReloadButton()
}

class ToolBar: UIToolbar {
    
    var toolBarDelegate: ToolBarDelegate?
    
    public func config() {
        
    }
    
    //MARK: - Actions
    @IBAction func didTapBackButton(_ sender: UIBarButtonItem) {
        toolBarDelegate?.didTapBackButton()
    }
    @IBAction func didTapForwardButton(_ sender: UIBarButtonItem) {
        toolBarDelegate?.didTapForwardButton()
    }
    @IBAction func didTapReloadButton(_ sender: UIBarButtonItem) {
        toolBarDelegate?.didTapReloadButton()
    }
}
