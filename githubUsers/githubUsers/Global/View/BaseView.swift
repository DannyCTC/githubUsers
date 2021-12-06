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
        var rect = UIScreen.main.bounds
        rect.size.height -= (kSafeAreaTopHeight+kSafeTabBarHeight)
        super.init(frame: rect)
        backgroundColor = .white
        initSetupSubviews()
        makeSubviewConstraints()

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
    func initSetupSubviews() -> Void{

    }

    /// 設置子視圖約束
    func makeSubviewConstraints() -> Void{

    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

}
