//
//  PersonModel.swift
//  githubUsers
//
//  Created by Danny on 2021/12/7.
//

import Foundation

struct PersonModel: Codable {
    let name: String
    let avatarURL: String
    let fullName: String
    let blog: String
    let location: String

    enum CodingKeys: String, CodingKey {
        case name = "login"
        case avatarURL = "avatar_url"
        case fullName = "name"
        case blog, location
    }
}
