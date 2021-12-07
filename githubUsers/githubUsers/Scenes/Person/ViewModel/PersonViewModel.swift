//
//  PersonViewModel.swift
//  githubUsers
//
//  Created by Danny on 2021/12/7.
//

import UIKit
import RxSwift
import RxCocoa

class PersonViewModel: BaseViewModel {
    var data = BehaviorRelay<PersonModel?>(value: nil)
    private let userName: String

    init(_ userName: String) {
        self.userName = userName
        super.init()
    }

    func startApi() {
        let request: Observable<PersonModel> = GitHubNet.request(endpoint: userName)
        let response = request
            .catchAndReturn(PersonModel(
                                name: "",
                                avatarURL: "",
                                fullName: "",
                                blog: "",
                                location: ""))
            .share(replay: 1, scope: .whileConnected)
        response
          .bind(to: data)
          .disposed(by: disposeBag)
    }
}
