// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import UIKit

protocol UserInfoWireframe {
    // 実装すべきメソッド
}

final class UserInfoRouter {
    private unowned let viewController: UIViewController
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }
    static func assembleModules(urlString: String) -> UIViewController {
        let view = UIStoryboard.userInfo.instantiateInitialViewController() as! UserInfoVC
        let interactor = UserInfoInteractor(urlString: urlString)
        let router = UserInfoRouter(viewController: view)
        let presenter = UserInfoPresenter(view: view, interactor: interactor, router: router)

        view.inject(presenter: presenter)
        return view
    }
}

extension UserInfoRouter: UserInfoWireframe {

}
