//
//  BaseView.swift
//  githubUsers
//
//  Created by Danny on 2021/12/7.
//

import UIKit
import RxSwift
import RxCocoa

class BaseViewModel: NSObject {
    let disposeBag = DisposeBag()
}

class BaseView: UIView {

    weak var owner: AnyObject?
    var disposeBag = DisposeBag()

    init() {
        super.init(frame: .zero)
    }

    init(owner: AnyObject?, frame: CGRect? = nil) {
        if let f = frame {
            super.init(frame: f)
        } else {
            var rect = UIScreen.main.bounds
            rect.size.height -= (kSafeAreaTopHeight+kSafeTabBarHeight)
            super.init(frame: rect)
        }
        backgroundColor = .white
        self.owner = owner
        initSetupSubviews()
        makeSubviewConstraints()
        setupOutlets(owner: owner)
        setup()

        for subview in subviews {
            subview.layoutSubviews()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// 初始化視圖參數
    func initSetupSubviews() -> Void {

    }

    /// 設置子視圖約束
    func makeSubviewConstraints() -> Void {

    }

    /// 設置視圖關聯關係
    func setupOutlets(owner: AnyObject?){
        if owner != nil && owner!.isKind(of: UIViewController.classForCoder()){
            (owner as! UIViewController).view = self
        }
    }

    /// 初始化設置
    func setup() -> Void {

    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

}
