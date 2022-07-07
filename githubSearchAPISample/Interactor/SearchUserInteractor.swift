// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import UIKit

protocol SearchUserInteractorInterface: class {
    // 実装すべきメソッド
}

final class SearchUserInteractor : SearchUserInteractorInterface {
    private let __SearchUser__API: SearchUserAPIInterface

    init(__SearchUser__API: SearchUserAPIInterface = SearchUserAPI()) {
        self.__SearchUser__API = __SearchUser__API
    }

    let url = "https://www.myendpoint.com"

    // Reference to the Presenter's output interface.
    weak var output: SearchUserInteractorOutput!


    // MARK: SearchUserInteractorInterface
}

extension SearchUserInteractor : SearchUserInteractorInterface {
    // 追加
}
