//
//  MineViewModel.swift
//  githubUsers
//
//  Created by Danny on 2021/12/7.
//

import UIKit
import RxSwift
import RxCocoa

class MineViewModel: BaseViewModel {
    var data = BehaviorRelay<MineModel?>(value: nil)

    func startApi() {
        let request: Observable<MineModel> = GitHubNet.request(endpoint: "DannyCTC")
        let response = request
            .catchAndReturn(MineModel(name: "",
                                      avatarURL: "",
                                      fullName: "",
                                      email: nil,
                                      followers: 0,
                                      following: 0))
            .share(replay: 1, scope: .whileConnected)
        response
          .bind(to: data)
          .disposed(by: disposeBag)
    }
}
