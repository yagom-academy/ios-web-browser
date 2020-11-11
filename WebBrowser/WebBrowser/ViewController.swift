//그린, 꼬말 웹 브라우저 프로젝트

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var buttonGoBack: UIBarButtonItem!
    @IBOutlet weak var buttonReload: UIBarButtonItem!
    @IBOutlet weak var buttonGoForward: UIBarButtonItem!
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var inputText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadUrl()
    }
    
    func loadUrl() {
        guard let url: URL = URL(string: "https://yagom.net") else { return }
        let request: URLRequest = URLRequest(url: url)

        webView.load(request)
    }
    
    @IBAction func buttonGoBack(_ sender: UIBarButtonItem) {
        if webView.canGoBack {
            webView.goBack()
        }
    }

    @IBAction func buttonReload(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    
    @IBAction func buttonGoForward(_ sender: UIBarButtonItem) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @IBAction func touchUpChangeButton(_ sender: UIButton) {
        let inputTextUrl: String? = inputText.text
        guard let inputUrl: String = inputTextUrl else { return }

        changeUrl(inputUrl)
    }
    
    func changeUrl(_ inputUrl: String) {
        let identifiedUrl: String = verifyUrl(inputUrl)
        
        guard let changeUrl: URL = URL(string: identifiedUrl) else { return }
        let changeRequest: URLRequest = URLRequest(url: changeUrl)
        
        webView.load(changeRequest)
    }
    
    func verifyUrl(_ unidentifiedUrl: String) -> String {
        let identifyUrl = unidentifiedUrl
        if !(identifyUrl.hasPrefix("http://") || identifyUrl.hasPrefix("https://")) {
            showAlertMessage()
        }
        return identifyUrl
    }
    
    func showAlertMessage() {
        let alert = UIAlertController(title: nil, message: "입력한 주소가 올바른 형태가 아닙니다.", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "확인", style: .cancel, handler : nil )
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
