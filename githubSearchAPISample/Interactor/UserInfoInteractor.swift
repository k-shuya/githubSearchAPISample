// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import Foundation

protocol UserInfoUsecase: AnyObject {
    func getURLString() -> String
}

final class UserInfoInteractor {
    private var urlString: String

    init(urlString: String) {
        self.urlString = urlString
    }
}

extension UserInfoInteractor: UserInfoUsecase {
    func getURLString() -> String {
        return self.urlString
    }
}
