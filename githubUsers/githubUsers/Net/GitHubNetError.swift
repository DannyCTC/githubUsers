//
//  GitHubNetError.swift
//  githubUsers
//
//  Created by Danny on 2021/12/7.
//

import Foundation

enum GitHubNetError: Error {
  case invalidURL(String)
  case invalidJSON(String)
  case invalidDecoderConfiguration
}
