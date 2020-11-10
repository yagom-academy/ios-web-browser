//그린, 꼬말 웹 브라우저 프로젝트

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var buttonGoForward: UIBarButtonItem!
    @IBOutlet weak var buttonReload: UIBarButtonItem!
    @IBOutlet weak var buttonGoBack: UIBarButtonItem!
    @IBOutlet weak var toolBar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadUrl()
    }
    
    func loadUrl() {
        guard let url = URL(string: "https://yagom.net") else { return }
        let request = URLRequest(url: url)

        webView.load(request)
    }
    
    @IBAction func buttonGoForward(_ sender: UIBarButtonItem) {
        if webView.canGoForward {
        webView.goForward()
        }
    }
    @IBAction func buttonReload(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    @IBAction func buttonGoBack(_ sender: UIBarButtonItem) {
        if webView.canGoBack {
        webView.goBack()
        }
    }
}


