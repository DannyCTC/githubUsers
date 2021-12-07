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
        setupEvent()
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

    private func setupEvent() {
        userView.userClick = {[weak self] user in
            guard let self = self else { return }
            self.toPersonVC(user.name)
        }
    }

    private func toPersonVC(_ name: String) {
        let vc = PersonViewController(name)
        self.present(vc, animated: true, completion: nil)
    }

}
