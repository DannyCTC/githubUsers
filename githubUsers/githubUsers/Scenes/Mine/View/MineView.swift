//
//  MineView.swift
//  githubUsers
//
//  Created by Danny on 2021/12/7.
//

import UIKit

class MineView: BaseView {

    override func initSetupSubviews() {
        addSubview(titleBack)
        addSubview(titleIcon)
        addSubview(titleLab)
        addSubview(subTitleLab)
        addSubview(followView)
        addSubview(mailView)
    }

    override func makeSubviewConstraints() {
        titleBack.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(self.snp.height).dividedBy(3)
        }
        titleIcon.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: kScreenW/4, height: kScreenW/4))
            make.centerY.equalTo(titleBack.snp.bottom)
            make.leading.equalToSuperview().offset(16)
        }
        titleLab.snp.makeConstraints { make in
            make.leading.equalTo(titleIcon.snp.leading)
            make.top.equalTo(titleIcon.snp.bottom).offset(12)
        }
        subTitleLab.snp.makeConstraints { make in
            make.leading.equalTo(titleIcon.snp.leading)
            make.top.equalTo(titleLab.snp.bottom).offset(4)
        }
        followView.snp.makeConstraints { make in
            make.leading.equalTo(titleIcon.snp.leading)
            make.top.equalTo(subTitleLab.snp.bottom).offset(8)
            make.height.equalTo(25)
        }
        mailView.snp.makeConstraints { make in
            make.leading.equalTo(titleIcon.snp.leading)
            make.top.equalTo(followView.snp.bottom)
            make.height.equalTo(25)
        }
    }

    /// 設置視圖關聯關係
    override func setupOutlets(owner: AnyObject?) {
        super.setupOutlets(owner: owner)
        if let vc = owner as? MineViewController {
            vc.view = self
        }
    }

    public func setupContents(mine: MineModel) -> Void {
        if let url = URL(string: mine.avatarURL) {
            titleIcon.setKFImage(with: url)
        }
        titleLab.text = mine.fullName
        subTitleLab.text = mine.name
        followView.setupText(followers: mine.followers, following: mine.following)
        guard let mail = mine.email else { return }
        mailView.setupText(text: mail)
    }

    private lazy var titleBack: UILabel = {
        let lab = UILabel()
        lab.backgroundColor = .blue
        lab.textColor = .white
        lab.font = .boldSystemFont(ofSize: 36)
        lab.textAlignment = .center
        lab.text = "GitHub Docs"
        return lab
    }()

    private lazy var titleIcon: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "tab_user_unselected"))
        iv.clipsToBounds = true
        iv.layer.cornerRadius = kScreenW / 8
        return iv
    }()

    private lazy var titleLab: UILabel = {
        let lab = UILabel()
        lab.textColor = .black
        lab.font = .systemFont(ofSize: 24)
        lab.textAlignment = .left
        return lab
    }()

    private lazy var subTitleLab: UILabel = {
        let lab = UILabel()
        lab.textColor = .lightGray
        lab.font = .systemFont(ofSize: 18)
        lab.textAlignment = .left
        return lab
    }()

    private lazy var followView: MineFollowersView = {
        let v = MineFollowersView()
        return v
    }()

    private lazy var mailView: PersonDetailView = {
        let v = PersonDetailView(type: .email)
        v.setupText(text: "edanny3@msn.com")
        return v
    }()
}
