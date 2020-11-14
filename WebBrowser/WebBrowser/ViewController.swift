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
        guard let inputURLString = textFieldForURL.text, let url = URL(string: inputURLString) else { return }
        if let validURL = textFieldForURL.text, validURL.hasPrefix("http://") || validURL.hasPrefix("https://") {
            let request = URLRequest(url: url)
            textFieldForURL.text?.removeAll()
            textFieldForURL.endEditing(true)
            webView.load(request)
        } else {
            let alertIndicatingInvalidURL = UIAlertController(title: "경고", message: "입력한 주소가 올바른 형태가 아닙니다. http:// 또는 https:// 를 넣은 URL로 입력해주세요.", preferredStyle: .alert)
            alertIndicatingInvalidURL.addAction(UIAlertAction(title: "확인", style: .default, handler: { _ in
                self.textFieldForURL.becomeFirstResponder()
            }))
            self.present(alertIndicatingInvalidURL, animated: true, completion: nil)
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
