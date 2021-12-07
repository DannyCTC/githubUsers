//
//  MineModel.swift
//  githubUsers
//
//  Created by Danny on 2021/12/7.
//

import Foundation

struct MineModel: Codable {
    let name: String
    let avatarURL: String
    let fullName: String
    let email: String?
    let followers, following: Int

    enum CodingKeys: String, CodingKey {
        case name = "login"
        case avatarURL = "avatar_url"
        case fullName = "name"
        case email
        case followers, following
    }
}
