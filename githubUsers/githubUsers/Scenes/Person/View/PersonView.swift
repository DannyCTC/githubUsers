//
//  PersonView.swift
//  githubUsers
//
//  Created by Danny on 2021/12/7.
//

import UIKit

class PersonView: BaseView {

    public func setupContents(person: PersonModel) -> Void {
        if let url = URL(string: person.avatarURL) {
            titleIcon.setKFImage(with: url)
        }
        titleLab.text = person.name
        nameView.setupText(text: person.fullName)
        locationView.setupText(text: person.location)
        blogView.setupText(text: person.blog)
    }

    override func initSetupSubviews() {
        addSubview(cancelBtn)
        addSubview(titleIcon)
        addSubview(titleLab)
        addSubview(splitLine)
        addSubview(nameView)
        addSubview(locationView)
        addSubview(blogView)
    }

    override func makeSubviewConstraints() {
        cancelBtn.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 50, height: 50))
            make.top.leading.equalToSuperview().offset(12)
        }
        titleIcon.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY).multipliedBy(0.5)
            make.size.equalTo(CGSize(width: kScreenW/2, height: kScreenW/2))
        }
        titleLab.snp.makeConstraints { make in
            make.centerX.equalTo(titleIcon.snp.centerX)
            make.top.equalTo(titleIcon.snp.bottom).offset(8)
        }
        splitLine.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview()
            make.centerY.equalTo(self.snp.centerY)
        }
        nameView.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: kScreenW*2/3, height: 25))
            make.centerX.equalTo(splitLine.snp.centerX)
            make.top.equalTo(splitLine.snp.bottom).offset(24)
        }
        locationView.snp.makeConstraints { make in
            make.size.equalTo(nameView.snp.size)
            make.centerX.equalTo(splitLine.snp.centerX)
            make.top.equalTo(nameView.snp.bottom).offset(16)
        }
        blogView.snp.makeConstraints { make in
            make.size.equalTo(nameView.snp.size)
            make.centerX.equalTo(splitLine.snp.centerX)
            make.top.equalTo(locationView.snp.bottom).offset(16)
        }
    }

    /// 設置視圖關聯關係
    override func setupOutlets(owner: AnyObject?) {
        super.setupOutlets(owner: owner)
        if let vc = owner as? PersonViewController {
            vc.view = self
        }
    }

    private(set) lazy var cancelBtn: BaseButton = {
        let b = BaseButton(imageName: "person_cancel")
        return b
    }()

    private lazy var titleIcon: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "tab_user_unselected"))
        iv.clipsToBounds = true
        iv.layer.cornerRadius = kScreenW / 4
        return iv
    }()

    private lazy var titleLab: UILabel = {
        let lab = UILabel()
        lab.textColor = .black
        lab.font = .systemFont(ofSize: 24)
        lab.textAlignment = .center
        return lab
    }()

    private lazy var splitLine: UIView = {
        let v = UIView()
        v.backgroundColor = .black
        return v
    }()

    private lazy var nameView: PersonDetailView = {
        let v = PersonDetailView(type: .name)
        return v
    }()

    private lazy var locationView: PersonDetailView = {
        let v = PersonDetailView(type: .location)
        return v
    }()

    private lazy var blogView: PersonDetailView = {
        let v = PersonDetailView(type: .blog)
        return v
    }()
}
