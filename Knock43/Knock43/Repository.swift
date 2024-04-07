//
//  Repository.swift
//  Knock43
//
//  Created by 白数叡司 on 2024/04/07.
//

import Foundation

public struct GithubSearchResult: Codable {
  public let items: [Repository]
}

public struct Repository: Codable, Hashable, Identifiable {
  public let id: Int
  public var fullName: String
  public let description: String?
  public let stargazersCount: Int
  public let language: String?
  public let htmlUrl: URL

  public init(id: Int, fullName: String, description: String?, stargazersCount: Int, language: String?, htmlUrl: URL) {
    self.id = id
    self.fullName = fullName
    self.description = description
    self.stargazersCount = stargazersCount
    self.language = language
    self.htmlUrl = htmlUrl
  }
}
