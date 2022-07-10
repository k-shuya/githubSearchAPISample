// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import UIKit

protocol SearchUserWireframe {
//    func showWeb(initParameters: WebUsecaseInitParameters)
    func showAlert(error: Error)
}

final class SearchUserRouter {
    private unowned let viewController: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func assembleModules() -> UIViewController {
        let view = UIStoryboard.searchUser.instantiateInitialViewController() as! SearchUserVC
        let interactor = SearchUserInteractor()
        let router = SearchUserRouter(viewController: view)
        let presenter = SearchUserPresenter(view: view, interactor: interactor, router: router)
        // viewとpresenterは互いが互いを知っている
        view.inject(presenter: presenter)
        return view
    }
}

extension SearchUserRouter: SearchUserWireframe {
//    func showWeb(initParameters: WebUsecaseInitParameters) {
//        let next = WebRouter.assembleModules(initParameters: initParameters)
//        viewController.show(next: next)
//    }
    
    func showAlert(error: Error) {
        print(error.localizedDescription)
    }
}
