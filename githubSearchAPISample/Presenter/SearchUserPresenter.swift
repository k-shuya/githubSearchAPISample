// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import UIKit

protocol SearchUserPresentation: AnyObject {
    func searchButtonDidPush(searchText: String)
    func didSelect(indexPath: IndexPath)
}

class SearchUserPresenter {
    private let interactor: SearchUserUsecase
    private let router: SearchUserWireframe

    private weak var view: SearchUserView?

    init(view: SearchUserView, interactor: SearchUserUsecase, router: SearchUserWireframe) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }

    // MARK: SearchUserPresenterInterface
}

extension SearchUserPresenter: SearchUserPresentation {
    func searchButtonDidPush(searchText: String) {
        if searchText.isEmpty { return }
        // `@escaping`がついているクロージャの場合は循環参照にならないよう`[weak self]`でキャプチャ
        interactor.get(keyword: searchText) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let items):
                self.view?.reloadTableView(items: items)
            case .failure(let error):
                self.router.showAlert(error: error)
            }
        }
    }

    func didSelect(indexPath: IndexPath) {
//        let gitHubSearchEntity = interactor.getResults()[indexPath.row]
//        let initParameters: WebUsecaseInitParameters = .init(entity: gitHubSearchEntity)
//        router.showWeb(initParameters: initParameters)
    }
}
