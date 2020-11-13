import UIKit

// AnyObject => Class Only Protocol
// Protocol을 채택할 수 있는 것을 Class로 제한하기 위해 사용.

//- Delegation Pattern의 장점
//    - 매우 엄격한 Syntax로 인해 프로토콜에 필요한 메소드들을 명확히 명시 해준다.
//    - 컴파일 시 경고나 에러가 떠서 프로토콜의 구현되지 않은 메소드를 알려준다.
//    - 프로토콜 메소드로 알려주는 것뿐만이 아니라 정보를 받을 수도 있다.
//    - 프로토콜이 컨트롤러의 범위 안에서 정의된다.
//- Delegation Pattern의 단점
//    - 많은 줄의 코드가 필요하다.
//    - 크래시를 일으킬 수 있기에, delegate 설정에 nil이 들어가지 않게 주의해야한다.
//    - 많은 객체들에게 이벤트를 알려주는 것이 어렵고 비효율적이다.

protocol ToolBarDelegate: AnyObject {
    func didTapBackButton(toolBar: ToolBar)
    func didTapForwardButton(toolBar: ToolBar)
    func didTapReloadButton(toolBar: ToolBar)
}

class ToolBar: UIToolbar {
    var toolBarDelegate: ToolBarDelegate?
    
    //MARK: - Actions
    @IBAction func didTapBackButton(_ sender: UIBarButtonItem) {
        toolBarDelegate?.didTapBackButton(toolBar: self)
    }
    @IBAction func didTapForwardButton(_ sender: UIBarButtonItem) {
        toolBarDelegate?.didTapForwardButton(toolBar: self)
    }
    @IBAction func didTapReloadButton(_ sender: UIBarButtonItem) {
        toolBarDelegate?.didTapReloadButton(toolBar: self)
    }
}
