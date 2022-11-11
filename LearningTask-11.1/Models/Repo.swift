//
//  Repo.swift
//  LearningTask-11.1
//
//  Created by rafael.rollo on 11/11/2022.
//

import Foundation

enum Visibility: String, Decodable {
    case publik = "public"
    case internl = "internal"
    case privat = "private"
    
    var textValue: String {
        switch self {
        case .publik:
            return "Public"
        case .internl:
            return "Internal"
        case .privat:
            return "Private"
        }
    }
}

struct Repo: Decodable {
    let id: Int?
    let name: String
    let fullName: String
    let url: URL
    let description: String?
    let isFork: Bool
    let createdAt: Date
    let updatedAt: Date
    let language: String
    let visibility: Visibility
    let defaultBranch: String
    let stars: Int
    
    var isPrivate: Bool {
        guard case Visibility.privat = self.visibility else { return false }
        return true
    }
    
    init(id: Int? = nil, name: String, fullName: String,
         url: URL, description: String?, isFork: Bool,
         createdAt: Date, updatedAt: Date, language: String,
         visibility: Visibility, defaultBranch: String, stars: Int) {
        self.id = id
        self.name = name
        self.fullName = fullName
        self.url = url
        self.description = description
        self.isFork = isFork
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.language = language
        self.visibility = visibility
        self.defaultBranch = defaultBranch
        self.stars = stars
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, description, language, visibility
        case fullName = "full_name"
        case url = "html_url"
        case isFork = "fork"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case defaultBranch = "default_branch"
        case stars = "stargazers_count"
    }
}
