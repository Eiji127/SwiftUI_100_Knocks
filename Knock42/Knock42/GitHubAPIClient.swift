//
//  GitHubAPIClient.swift
//  Knock42
//
//  Created by 白数叡司 on 2024/04/07.
//

import Foundation

struct GitHubAPIClient {
    func fetchRepositories(page: Int, perPage: Int) async throws -> [Repository] {
        let url = URL(
            string: "https://api.github.com/search/repositories?q=swift&sort=stars&page=\(page)&per_page=\(perPage)"
        )!
        var request = URLRequest(url: url)
        if let token = Bundle.main.infoDictionary?["GitHubPersonalAccessToken"] as? String {
            request.setValue(
                "Bearer \(token)",
                forHTTPHeaderField: "Authorization"
            )
        }
        let (data, _) = try await URLSession.shared.data(for: request)
        let repositories = try jsonDecoder.decode(
            GithubSearchResult.self,
            from: data
        ).items
        return repositories
    }

    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}
