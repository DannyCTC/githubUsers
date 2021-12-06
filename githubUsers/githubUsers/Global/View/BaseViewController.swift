//
//  BaseViewController.swift
//  githubUsers
//
//  Created by Danny on 2021/12/6.
//

import UIKit
import RxSwift
import RxCocoa

class BaseViewController: UIViewController {
    var disposeBag = DisposeBag()

    lazy var titleView: UIView = {
        let _size = CGSize( width: 123, height: 40)
        let titleView = UIView(frame: CGRect(origin: .zero, size: _size))
        titleView.isHidden = false
        return titleView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.titleView = titleView
        let textAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15),NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        configNavigationTitleView()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

    func configNavigationTitleView(){
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.text = "GitHub"
        titleLabel.textAlignment = .center
        navigationItem.titleView = titleLabel
        navigationItem.titleView?.isHidden = false
    }

    private lazy var titleLabel: UILabel = {
        let lab = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
        return lab
    }()
}
