// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import Foundation

protocol UserInfoPresentation: AnyObject {
    func viewDidLoad()
}

class UserInfoPresenter {
    private let interactor: UserInfoUsecase
    private let router: UserInfoWireframe

    private weak var view: UserInfoView?

    init(view: UserInfoView, interactor: UserInfoUsecase, router: UserInfoWireframe) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension UserInfoPresenter: UserInfoPresentation {
    func viewDidLoad() {
        guard let url = URL(string: interactor.getURLString()) else { return }
            self.view?.request(url: url)
    }
}
