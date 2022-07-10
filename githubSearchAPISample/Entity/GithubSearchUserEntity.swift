//
//  GithubSearchUserEntity.swift
//  githubSearchAPISample
//
//  Created by 川村周也 on 2022/07/08.
//

import Foundation

struct GithubSearchUserItems: Codable {
    let items: [GithubSearchUserEntity]
    
    enum CodingKeys: String, CodingKey {
        case items = "items"
    }
}

struct GithubSearchUserEntity: Codable {
    let login: String
    let type: String
    let avatarUrl: String
    let htmlUrl: String
    
    enum CodingKeys: String, CodingKey {
        case login = "login"
        case type = "type"
        case avatarUrl = "avatar_url"
        case htmlUrl = "html_url"
    }
}
