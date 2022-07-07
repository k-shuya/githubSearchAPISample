// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import UIKit

protocol SearchUserPresenterInterface: class {
    // 実装すべきメソッド
}

class SearchUserPresenter : SearchUserPresenterInterface {
    private let interactor: SearchUserInteractorInterface
    private let router: SearchUserRouterInterface

    private weak var view: SearchUserView?

    init(interactor: SearchUserInteractorInterface,
        router: SearchUserRouterInterface,
        view: SearchUserView
    ) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }

    // MARK: SearchUserPresenterInterface
}
