//
//  GithubAPIError.swift
//  githubSearchAPISample
//
//  Created by 川村周也 on 2022/07/10.
//

import Foundation

enum GithubAPIError: Error {
    case invalidURL
    case invalidResponse
    case unknown(Error)
}

extension GithubAPIError {
    var githubAPIError: String {
        switch self {
            case .invalidResponse: return "無効なレスポンスです。"
            case .invalidURL: return "無効なURLです。"
            case .unknown(let error): return "予期せぬエラーが発生しました。\(error)"
        }
    }
}
