// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import UIKit

protocol SearchUserPresenterInterface: class {
    // 実装すべきメソッド
}

class SearchUserPresenter {
    private let interactor: SearchUserInteractorInterface
    private weak var view: SearchUserViewInterface?
//    private let router: SearchUserRouterInterface

    init(interactor: SearchUserInteractorInterface,
//        router: SearchUserRouterInterface,
        view: SearchUserViewInterface
    ) {
        self.interactor = interactor
//        self.router = router
        self.view = view
    }

    // MARK: SearchUserPresenterInterface
}

extension SearchUserPresenter: SearchUserPresenterInterface {
    
}
