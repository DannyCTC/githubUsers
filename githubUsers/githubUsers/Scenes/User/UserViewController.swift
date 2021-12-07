//
//  UserViewController.swift
//  githubUsers
//
//  Created by Danny on 2021/12/6.
//

import UIKit

class UserViewController: BaseViewController {

    var viewModel = UserViewModel()
    var userView: UserView!

    override func loadView() {
        super.loadView()
        userView = UserView.init(owner: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        binding()
        viewModel.startApi()
    }

    private func binding() {
        viewModel.listData
            .asObservable()
            .subscribe(onNext: { [weak self] data in
                DispatchQueue.main.async {
                    self?.userView.setupContents(users: data)
                }
            }).disposed(by: disposeBag)
    }

}
