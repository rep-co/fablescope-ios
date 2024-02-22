
import UIKit

protocol MainRouter {
    func openFormScreenViewController()
}

struct MainRouterImpl {
    weak var controller: MainScreenViewController?
}

// MARK: - MainRouter
extension MainRouterImpl: MainRouter {
    func openFormScreenViewController() {
        let formScreenController = FormScreenViewController()
        controller?.navigationController?.pushViewController(formScreenController, animated: true)
    }    
}
