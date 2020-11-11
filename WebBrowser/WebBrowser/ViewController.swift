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
        let inputUrl: String? = inputText.text
        guard let input: String = inputUrl else { return }

        changeUrl(input)
    }
    
    func changeUrl(_ input: String) {
        let checkedUrl: String = verifyUrl(input)
        
        guard let inputUrl: URL = URL(string: checkedUrl) else { return }
        let changeRequest: URLRequest = URLRequest(url: inputUrl)
        
        webView.load(changeRequest)
    }
    
    func verifyUrl(_ urlCheck: String) -> String {
        let checkUrl = urlCheck
        if !(checkUrl.hasPrefix("http://") || checkUrl.hasPrefix("https://")) {
            showAlertMessage()
        }
        return checkUrl
    }
    
    func showAlertMessage() {
        let alert = UIAlertController(title: nil, message: "입력한 주소가 올바른 형태가 아닙니다.", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "확인", style: .cancel, handler : nil )
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
