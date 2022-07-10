// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import UIKit

enum SearchUserRouterNavigationDestination {
    // 遷移先を追加
    case __next1__
}

protocol SearchUserRouterInterface: RouterInterface {
    func navigate(to destination: SearchUserRouterNavigationDestination)
}

final class SearchUserRouter : BaseRouter {

    init() {
        let vc = SearchUserVC()
        super.init(vc)

        let interactor = SearchUserInteractor()
        let presenter = SearchUserPresenter(interactor: interactor, router: self, view: vc)
        vc.presenter = presenter
    }
}

extension SearchUserRouter : BaseRouter {
    func navigate(to destination: SearchUserRouterNavigationDestination) {
        // switchで遷移先を振り分けていく
    }
}
