//그린, 꼬말 웹 브라우저 프로젝트

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var loadIndicator: UIActivityIndicatorView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadUrl()
    }

    func loadUrl() {
        guard let url: URL = URL(string: "https://yagom.net") else { return }
        let request: URLRequest = URLRequest(url: url)
        
        webView.navigationDelegate = self
        
        webView.load(request)
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        loadIndicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadIndicator.stopAnimating()
    }
  
    @IBAction func touchUpChangeButton(_ sender: UIButton) {
        guard let inputUrl: String = inputField.text else { return }

        changeUrl(inputUrl)
    }
    
    func changeUrl(_ inputUrl: String) {
        let identifiedUrl: String = verifyUrl(inputUrl)

        guard let urlToChange: URL = URL(string: identifiedUrl) else { return }
        let changeRequest: URLRequest = URLRequest(url: urlToChange)
        
        webView.load(changeRequest)
    }
  
    @IBAction func touchUpBackButton(_ sender: UIBarButtonItem) {
        if webView.canGoBack {
            webView.goBack()
        }
    }

    @IBAction func touchUpReloadButton(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    
    @IBAction func touchUpForwardButton(_ sender: UIBarButtonItem) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
  
    func verifyUrl(_ unidentifiedUrl: String) -> String {
        let identifyUrl = unidentifiedUrl.lowercased()
        if !(identifyUrl.hasPrefix("http://") || identifyUrl.hasPrefix("https://")) {
            showAlertMessage()
            return "입력한 주소가 올바른 형태가 아닙니다."
        }
        return identifyUrl
    }
    
    func showAlertMessage() {
        let alert = UIAlertController(title: nil, message: "입력한 주소가 올바른 형태가 아닙니다.", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "확인", style: .cancel, handler : nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
