//
//  PersonViewController.swift
//  githubUsers
//
//  Created by Danny on 2021/12/7.
//

import UIKit
import RxSwift
import RxCocoa

class PersonViewController: UIViewController {
    var viewModel: PersonViewModel
    var personView: PersonView!
    var disposeBag = DisposeBag()
    
    init(_ name: String) {
        viewModel = PersonViewModel(name)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        personView = PersonView.init(owner: self)
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
                    self?.personView.setupContents(person: data)
                }
            }).disposed(by: disposeBag)
        personView.cancelBtn.rx.tap.subscribe (onNext:{[weak self] in
            guard let self = self else { return }
            self.dismiss(animated: true, completion: nil)
        }).disposed(by: disposeBag)
    }

}
