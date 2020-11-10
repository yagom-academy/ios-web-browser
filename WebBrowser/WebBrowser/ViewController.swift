//그린, 꼬말 웹 브라우저 프로젝트

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadUrl()
    }
    
    func loadUrl() {
        guard let url = URL(string: "https://yagom.net") else { return }
        let request = URLRequest(url: url)
        
        webView.load(request)
    }
}
