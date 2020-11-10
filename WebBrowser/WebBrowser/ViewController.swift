//그린, 꼬말 웹 브라우저 프로젝트

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    override func loadView() {
        super.loadView()
        
        webView? = WKWebView(frame: self.view.frame)
        self.view = self.webView!
        
        loadUrl()
    }

    /*
     웹 페이지를 보여주는 함수
     code by 그린,꼬말
    */
    func loadUrl() {
        guard let url = URL(string: "https://yagom.net") else { return }
        let request = URLRequest(url: url)
        
        webView?.load(request)
    }
}
