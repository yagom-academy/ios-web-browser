import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var urlTextField: UITextField!
    
    var urlAddress: String = "https://www.rapid7.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        let alert = UIAlertController(title: "접근할 수 없습니다.", message: "유효하지 않은 URL입니다.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .cancel))
        self.present(alert, animated: true)
    }
    
    @IBAction func goPressed(_ sender: UIButton) {
        guard let requestUrl = urlTextField.text else {
            showInvaildUrlAlert()
            return
        }
        
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
}
