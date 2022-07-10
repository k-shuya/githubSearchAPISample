//
//  GithubAPI.swift
//  githubSearchAPISample
//
//  Created by 川村周也 on 2022/07/09.
//

import Alamofire

typealias ResultHandler<T> = (Result<T, GithubAPIError>) -> Void

struct GithubAPI {
    func requestSearchUser(keyword: String, handler: @escaping ResultHandler<GithubSearchUserItems>) {
        if URL(string: GithubAPIEndpoints.searchUser) == nil {
            handler(.failure(.invalidURL))
            return
        }

        AF.request(GithubAPIEndpoints.searchUser + "?q=" + keyword).responseData { response in
            guard let data = response.data else {
                handler(.failure(.invalidResponse))
                return
            }
            do {
                let items = try JSONDecoder().decode(GithubSearchUserItems.self, from: data)
                handler(.success(items))
            } catch {
                handler(.failure(.unknown(error)))
            }
        }
    }
}
