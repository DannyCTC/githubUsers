//
//  UserModel.swift
//  githubUsers
//
//  Created by Danny on 2021/12/7.
//

import Foundation

struct UserModel: Codable {
    let name: String
    let avatarURL: String

    enum CodingKeys: String, CodingKey {
        case name = "login"
        case avatarURL = "avatar_url"
    }
}
