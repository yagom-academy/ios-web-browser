//그린, 꼬말 웹 브라우저 프로젝트

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
//    override func loadView() {
//        super.loadView()
//
//        webView? = WKWebView(frame: self.view.frame)
//        view = webView!
//
//    }

    func loadUrl() {
        guard let url = URL(string: "https://yagom.net") else { return }
        let request = URLRequest(url: url)

        webView.load(request)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view = webView!
        
        loadUrl()
    }
    
    
    @IBOutlet weak var btnGoForward: UIBarButtonItem!
    @IBOutlet weak var btnReload: UIBarButtonItem!
    @IBOutlet weak var btnGoBack: UIBarButtonItem!
    @IBOutlet weak var toolBar: UIToolbar!
    
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        if webView.canGoForward {
        webView.goForward()
        }
    }
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        if webView.canGoBack {
        webView.goBack()
        }
    }
}


