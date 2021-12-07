//
//  UserViewModel.swift
//  githubUsers
//
//  Created by Danny on 2021/12/7.
//

import UIKit
import RxSwift
import RxCocoa

class UserViewModel: BaseViewModel {
    var listData = BehaviorRelay<[UserModel]>(value: [])

    func startApi() {
        let request: Observable<[UserModel]> = GitHubNet.request()
        let response = request
            .catchAndReturn([])
            .share(replay: 1, scope: .whileConnected)
        response
          .bind(to: listData)
          .disposed(by: disposeBag)
    }
    
}
