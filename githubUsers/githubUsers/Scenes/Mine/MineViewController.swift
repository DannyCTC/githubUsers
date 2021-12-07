//
//  MineViewController.swift
//  githubUsers
//
//  Created by Danny on 2021/12/6.
//

import UIKit

class MineViewController: BaseViewController {
    var viewModel = MineViewModel()
    var mineView: MineView!

    override func loadView() {
        super.loadView()
        mineView = MineView.init(owner: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        binding()
        viewModel.startApi()
    }

    private func binding() {
        viewModel.data
            .asObservable()
            .subscribe(onNext: { [weak self] data in
                guard let data = data else { return }
                DispatchQueue.main.async {
                    self?.mineView.setupContents(mine: data)
                }
            }).disposed(by: disposeBag)
    }
}
