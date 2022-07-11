// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import UIKit

protocol SearchUserWireframe {
    func showUserInfo(urlString: String)
    func showAlert(error: Error)
}

final class SearchUserRouter {
    private unowned let viewController: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func assembleModules() -> UIViewController {
        let nc = UIStoryboard.searchUser.instantiateInitialViewController() as! UINavigationController
        let view = nc.viewControllers[0] as! SearchUserVC
//        let view = UIStoryboard.searchUser.instantiateInitialViewController() as! SearchUserVC
        let interactor = SearchUserInteractor()
        let router = SearchUserRouter(viewController: view)
        let presenter = SearchUserPresenter(view: view, interactor: interactor, router: router)

        view.inject(presenter: presenter)
        return view
    }
}

extension SearchUserRouter: SearchUserWireframe {
    func showUserInfo(urlString: String) {
        let next = UserInfoRouter.assembleModules(urlString: urlString)
        viewController.navigationController?.show(next, sender: nil)
//        viewController.show(next, sender: nil)
    }
    
    func showAlert(error: Error) {
        print(error.localizedDescription)
    }
}
