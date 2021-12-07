//
//  GitHubNet.swift
//  githubUsers
//
//  Created by Danny on 2021/12/7.
//

import Foundation
import RxSwift
import RxCocoa

class GitHubNet {
    static let API = "https://api.github.com"
    static let categoriesEndpoint = "users"

    static func request<T: Decodable>(endpoint: String = categoriesEndpoint) -> Observable<T> {
      do {
        let ep = (endpoint != categoriesEndpoint) ?
                    (categoriesEndpoint + "/" + endpoint):categoriesEndpoint
        guard let url = URL(string: API)?.appendingPathComponent(ep),
              let components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            throw GitHubNetError.invalidURL(endpoint)
        }

        guard let finalURL = components.url else {
          throw GitHubNetError.invalidURL(endpoint)
        }

        let request = URLRequest(url: finalURL)

        return URLSession.shared.rx.response(request: request)
          .map { (result: (response: HTTPURLResponse, data: Data)) -> T in
            let decoder = JSONDecoder()
            let content = try decoder.decode(T.self, from: result.data)
            print("request: \(content)")
            return content
        }
      } catch {
        return Observable.empty()
      }
    }
}
