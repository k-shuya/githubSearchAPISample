// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import Foundation

protocol SearchUserInteractorInterface: class {
//    func get(parameters: GitHubSearchParameters, handler: ResultHandler<GithubSearchUserItems>?)
    func get(handler: ResultHandler<GithubSearchUserItems>?)
    func getSearchedItems() -> [GithubSearchUserEntity]
}

final class SearchUserInteractor {
    private let githubSearchAPI: GithubAPI
    private var items: [GithubSearchUserEntity] = [GithubSearchUserEntity]()

    init(githubSearchAPI: GithubAPI = GithubAPI()) {
        self.githubSearchAPI = githubSearchAPI
    }

    let url = "https://www.myendpoint.com"

    // Reference to the Presenter's output interface.
//    weak var output: SearchUserInteractorOutput!


    // MARK: SearchUserInteractorInterface
}

extension SearchUserInteractor: SearchUserInteractorInterface {
    func get(handler: ResultHandler<GithubSearchUserItems>?) {
        githubSearchAPI.request { result in
            switch result {
            case .success(let items):
                self.items = items.items
            case .failure(let error):
                break
//                self.showAPIAlert(error: error)
            }
        }
    }
    
    func getSearchedItems() -> [GithubSearchUserEntity] {
        return items
    }
    
//    func showAPIAlert(error: GithubAPIError) {
//        let alert = UIAlertController(title: error.title, message: nil, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "閉じる", style: .cancel, handler: nil))
//        self.present(alert, animated: true, completion: nil)
//    }
}
