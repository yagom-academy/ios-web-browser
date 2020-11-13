import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet var webView: WebView!
    @IBOutlet var toolBar: ToolBar!
    
    /*
    WKNavigationDelegate을 사용하여 Error메시지를 출력해 보았더니
    "The resource could not be loaded because the App Transport Security policy requires
    the use of a secure connection."
    위의 에러 메시지를 찾아 검색해봤더니 찌로의 방법과 똑같은 방법들이었다. 우선은 그 방법을 해결 방법으로 사용하고 계속해서 찾아볼 예정이다.
    */
    @IBOutlet weak var searchBar: SearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.urlRequest(to: "https://daum.net")
        
        //Configuration views
        searchBar.searchBarConfig()
        
        //ToolBarDelegate
        toolBar.toolBarDelegate = self
    }
    
    @IBAction func didTapSearchButton(_ sender: UIButton) {
        guard let urlToRequest = searchBar.text else {
            fatalError("URL이 유효하지 않습니다!")
        }
        
        if !webView.urlRequest(to: urlToRequest) {
            let alert = UIAlertController(title: "주의",
                                          message: "입력한 주소가 올바른 형태가 아닙니다!",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인",
                                          style: .cancel,
                                          handler: .none))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension ViewController: ToolBarDelegate {
    func didTapBackButton(toolBar: ToolBar) {
        webView.goBack()
    }
    
    func didTapForwardButton(toolBar: ToolBar) {
        webView.goForward()
    }
    
    func didTapReloadButton(toolBar: ToolBar) {
        webView.reload()
    }
}

