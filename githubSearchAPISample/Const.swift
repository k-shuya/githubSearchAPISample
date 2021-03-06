//
//  Const.swift
//  githubSearchAPISample
//
//  Created by 川村周也 on 2022/07/09.
//

import Foundation

public struct GithubAPIEndpoints {
    public static let searchUser = "https://api.github.com/search/users"
}

public struct StoryBoardNames {
    static let searchUser = "SearchUser"
    static let userInfo = "UserInfo"
}

public struct SearchUserConfig {
    static let resultTVCNibName = "SearchUserTableViewCell"
    static let resultTVCIdentifier = "userCell"
    static let serchBarPlaceholder = "ユーザ名で検索"
}
