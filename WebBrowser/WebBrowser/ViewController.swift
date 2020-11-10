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
        guard let url = URL(string: "https://yagom.net") else { return }
        let request = URLRequest(url: url)

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
    
    func changeUrl(input : String) {
        guard let inputUrl = URL(string: input) else { return }
        let changeRequest = URLRequest(url: inputUrl)
        
        webView.load(changeRequest)
    }
    
    @IBAction func touchUpChangeButton(_ sender: UIButton) {
        let inputUrl : String? = inputText.text
        guard let input = inputUrl else { return }
        print(input)
        changeUrl(input: input)
    }
}
