//
//  User.swift
//  LearningTask-11.1
//
//  Created by rafael.rollo on 11/11/2022.
//

import Foundation

struct User {
    let id: Int?
    let username: String
    let fullName: String
    let imagePath: URL
    
    init(id: Int? = nil, username: String, fullName: String, imagePath: URL) {
        self.id = id
        self.username = username
        self.fullName = fullName
        self.imagePath = imagePath
    }
}
