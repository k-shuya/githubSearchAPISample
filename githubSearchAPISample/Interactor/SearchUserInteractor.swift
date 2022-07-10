// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import UIKit

protocol SearchUserUsecase: AnyObject {
    func get(keyword: String, handler: ResultHandler<[GithubSearchUserEntity]>?)
    func getResults() -> [GithubSearchUserEntity]?
}

final class SearchUserInteractor {
    private let githubAPI: GithubAPI
    private var results: [GithubSearchUserEntity]?

    init(githubAPI: GithubAPI = GithubAPI()) {
        self.githubAPI = githubAPI
        results = []
    }


    // MARK: SearchUserInteractorInterface
}

extension SearchUserInteractor: SearchUserUsecase {
    func get(keyword: String, handler: ResultHandler<[GithubSearchUserEntity]>? = nil) {
        self.githubAPI.requestSearchUser(keyword: keyword) { result in
            switch result {
                case .success(let results):
                    handler?(.success(results))
                    self.results = results
                case .failure(let error):
                    handler?(.failure(error))
            }
        }
    }
    
    func getResults() -> [GithubSearchUserEntity]? {
        return self.results
    }
}
