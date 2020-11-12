import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var urlTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlAddress: String = "https://www.rapid7.com"
        loadWebPage(url: urlAddress)
        urlTextField.text = urlAddress
        webView.navigationDelegate = self
    }
    
    func loadWebPage(url: String) {
        guard let requestUrl = URL(string: url) else {
            showInvaildUrlAlert()
            return
        }
        
        let request = URLRequest(url: requestUrl)
        webView.load(request)
    }
    
    func showInvaildUrlAlert() {
        let alert = UIAlertController(title: "접근할 수 없습니다.", message: "URL 형식이 아니거나 유효하지 않은 URL입니다. 올바른 URL을 입력해주세요.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .cancel))
        self.present(alert, animated: true)
    }
    
    func updateUrlField() {
        if let currentUrl = webView.url {
            urlTextField.text = currentUrl.absoluteString
        }
    }
    
    func isValidUrl(url: String) -> Bool {
        guard let _ = url.range(of: #"^https?://"#, options: .regularExpression) else {
            return false
        }
        
        return true
    }
    
    func addHttpsProtocolName(url: String) -> String {
        if isValidUrl(url: url) {
            return url
        } else {
            return "https://" + url
        }
    }
    
    @IBAction func goPressed(_ sender: UIButton) {
        guard var requestUrl = urlTextField.text else {
            showInvaildUrlAlert()
            return
        }
        
        requestUrl = addHttpsProtocolName(url: requestUrl)
        loadWebPage(url: requestUrl)
    }
    
    @IBAction func stopPressed(_ sender: UIBarButtonItem) {
        webView.stopLoading()
    }
    
    @IBAction func reloadPressed(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    
    @IBAction func goBackPressed(_ sender: UIBarButtonItem) {
        webView.goBack()
    }
    
    @IBAction func goForwardPressed(_ sender: UIBarButtonItem) {
        webView.goForward()
    }
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        showInvaildUrlAlert()
        updateUrlField()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        updateUrlField()
    }
}
