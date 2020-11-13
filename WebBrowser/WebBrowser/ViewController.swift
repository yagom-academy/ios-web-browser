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
        let request = URLRequest(url: url)
        textFieldForURL.text?.removeAll()
        textFieldForURL.endEditing(true)
        webView.load(request)
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
        
        guard let url = URL(string: "https://yagom.net") else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.moveToURL(moveToURLButton)
        return true
    }
}
