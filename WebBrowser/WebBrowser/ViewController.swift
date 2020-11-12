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
    
    func isValidUrl(url: String) -> Bool {
        guard let _ = url.range(of: #"^https?://"#, options: .regularExpression) else {
            return false
        }
        
        return true
    }
    
    @IBAction func goPressed(_ sender: UIButton) {
        guard let requestUrl = urlTextField.text else {
            showInvaildUrlAlert()
            return
        }
        
        if isValidUrl(url: requestUrl) {
            loadWebPage(url: requestUrl)
        } else {
            showInvaildUrlAlert()
        }
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
