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
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    // MARK: SearchUserPresenterInterface
}

extension SearchUserPresenter: SearchUserPresentation {
    func searchButtonDidPush(searchText: String) {
        // TODO:- 空のクエリの時の処理(アラート出すとか、EmptyImage出すとか)
        if searchText.isEmpty {
            self.view?.reloadTableView(items: [GithubSearchUserEntity]())
            return
        }
        // '@escaping'がついているクロージャの場合は循環参照にならないよう'[weak self]'でキャプチャ
        interactor.get(keyword: searchText) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let items):
                self.view?.reloadTableView(items: items)
            case .failure(let error):
                self.view?.showErrorAlert(error: error)
            }
        }
    }

    func didSelect(indexPath: IndexPath) {
        let gitHubSearchUserEntity = interactor.getResults()![indexPath.row]
        let urlString: String = gitHubSearchUserEntity.htmlUrl
        router.showUserInfo(urlString: urlString)
    }
}
