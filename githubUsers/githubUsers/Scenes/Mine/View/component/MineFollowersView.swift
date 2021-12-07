//
//  MineFollowersView.swift
//  githubUsers
//
//  Created by Danny on 2021/12/7.
//

import UIKit

class MineFollowersView: UIView {

    init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupText(followers: Int, following: Int) {
        followersCountLab.text = String(followers)
        followingCountLab.text = String(following)
    }

    private lazy var titleIcon: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "mine_followers"))
        return iv
    }()

    private lazy var followersCountLab: UILabel = {
        let lab = UILabel()
        lab.textColor = .black
        lab.font = .boldSystemFont(ofSize: 12)
        lab.textAlignment = .left
        lab.text = "0"
        return lab
    }()

    private lazy var followersLab: UILabel = {
        let lab = UILabel()
        lab.textColor = .lightGray
        lab.font = .systemFont(ofSize: 12)
        lab.textAlignment = .left
        lab.text = "followers．"
        return lab
    }()

    private lazy var followingCountLab: UILabel = {
        let lab = UILabel()
        lab.textColor = .black
        lab.font = .boldSystemFont(ofSize: 12)
        lab.textAlignment = .left
        lab.text = "0"
        return lab
    }()

    private lazy var followingLab: UILabel = {
        let lab = UILabel()
        lab.textColor = .lightGray
        lab.font = .systemFont(ofSize: 12)
        lab.textAlignment = .left
        lab.text = "following．"
        return lab
    }()
}

extension MineFollowersView {
    private func setupView() {
        addSubview(titleIcon)
        titleIcon.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
            make.width.equalTo(titleIcon.snp.height)
        }
        addSubview(followersCountLab)
        followersCountLab.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(titleIcon.snp.trailing).offset(16)
        }
        addSubview(followersLab)
        followersLab.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(followersCountLab.snp.trailing).offset(4)
        }
        addSubview(followingCountLab)
        followingCountLab.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(followersLab.snp.trailing)
        }
        addSubview(followingLab)
        followingLab.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(followingCountLab.snp.trailing).offset(4)
        }
    }
}
