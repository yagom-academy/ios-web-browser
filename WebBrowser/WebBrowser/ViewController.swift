import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        loadWebPage(url: "https://www.rapid7.com")
    }
    
    func loadWebPage(url: String) {
        if let requestUrl = URL(string: url) {
            let request = URLRequest(url: requestUrl)
            webView.load(request)
        }
    }
}
