//
//  WebBrowser - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit
import WebKit

enum URLError: Error {
    case emptyString
    case illegalCharacters
    
    func errorMessage() -> String {
        var message: String
        switch self {
        case .emptyString:
            message = "빈 문자열입니다"
        case .illegalCharacters:
            message = "잘못된 문자가 포함되어있습니다"
        }
        
        return "[URL 생성 오류] \(message)"
    }
}

final class ViewController: UIViewController {
    @IBOutlet private weak var webView: WKWebView!
    @IBOutlet private weak var urlInputField: UITextField!
    @IBOutlet private weak var backButton: UIBarButtonItem!
    @IBOutlet private weak var forwardButton: UIBarButtonItem!
    
    @IBAction private func move(_ sender: UIButton) {
        guard let input = urlInputField.text else {
            fatalError("유효하지 않은 입력입니다")
        }
        guard let inputURL = URL(string: input) else {
            if input.isEmpty { fatalError(URLError.emptyString.errorMessage()) }
            else { fatalError(URLError.illegalCharacters.errorMessage()) }
        }
        
        let request = URLRequest(url: inputURL)
        webView.load(request)
        
        backFowardSetting()
    }
    
    @IBAction private func goBack(_ sender: UIBarButtonItem) {
        webView.goBack()
        backFowardSetting()
    }
    
    @IBAction private func goForward(_ sender: UIBarButtonItem) {
        webView.goForward()
        backFowardSetting()
    }
    
    @IBAction private func reload(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backFowardSetting()
    }
    
    private func backFowardSetting() {
        backButton.isEnabled = !webView.backForwardList.backList.isEmpty
        forwardButton.isEnabled = !webView.backForwardList.forwardList.isEmpty
    }
}
