//
//  WebBrowser - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit
import WebKit

class ViewController: UIViewController {

    //MARK:- IBOutlets
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textFieldForURL: UITextField!
    @IBOutlet weak var moveToURLButton: UIButton!
    
    //MARK:- IBActions
    @IBAction func moveToURL(_ sender: UIButton) {
        guard let inputURLString = textFieldForURL.text, let url = URL(string: inputURLString) else {
            let inputURLAlert = UIAlertController(title: "경고", message: "주소창에 이동하고자 하는 페이지의 주소를 입력해주세요.", preferredStyle: .alert)
            inputURLAlert.addAction(UIAlertAction(title: "확인", style: .default, handler: { _ in
                self.textFieldForURL.becomeFirstResponder()
            }))
            self.present(inputURLAlert, animated: true, completion: nil)
            return
        }
        
        let range = NSRange(location: 0, length: inputURLString.count)
        let regExpForValidURL = try! NSRegularExpression(pattern: "http(s)?://")
        
        if regExpForValidURL.firstMatch(in: inputURLString, range: range) != nil {
            let request = URLRequest(url: url)
            textFieldForURL.text?.removeAll()
            textFieldForURL.endEditing(true)
            webView.load(request)
        } else {
            let invalidURLAlert = UIAlertController(title: "경고", message: "입력한 주소가 올바른 형태가 아닙니다. http://www 또는 https://www 를 넣은 URL로 입력해주세요.", preferredStyle: .alert)
            invalidURLAlert.addAction(UIAlertAction(title: "확인", style: .default, handler: { _ in
                self.textFieldForURL.becomeFirstResponder()
            }))
            self.present(invalidURLAlert, animated: true, completion: nil)
        }
    }
    
    @IBAction func moveBackwards(_ sender: Any) {
        webView.goBack()
    }
    @IBAction func moveForwards(_ sender: Any) {
        webView.goForward()
    }
    @IBAction func refresh(_ sender: Any) {
        textFieldForURL.text?.removeAll()
        webView.reload()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldForURL.keyboardType = UIKeyboardType.URL
        textFieldForURL.autocorrectionType = UITextAutocorrectionType.no
        textFieldForURL.returnKeyType = UIReturnKeyType.go
        textFieldForURL.clearButtonMode = UITextField.ViewMode.whileEditing
        
        self.webView.navigationDelegate = self
        
        guard let url = URL(string: "https://yagom.net") else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

//MARK:- Extensions
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.moveToURL(moveToURLButton)
        return true
    }
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        let pageNotFoundAlert = UIAlertController(title: "경고", message: "요청하신 페이지를 찾을 수 없습니다.", preferredStyle: .alert)
        pageNotFoundAlert.addAction(UIAlertAction(title: "확인", style: .default, handler: { _ in
            self.textFieldForURL.becomeFirstResponder()
        }))
        self.present(pageNotFoundAlert, animated: true, completion: nil)
    }
}
