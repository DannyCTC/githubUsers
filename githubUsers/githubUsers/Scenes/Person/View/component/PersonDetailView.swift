//
//  PersonDetailView.swift
//  githubUsers
//
//  Created by Danny on 2021/12/7.
//

import UIKit
import SnapKit

class PersonDetailView: UIView {
    private let type: type

    enum type {
        case name, location, blog, email
        func getImage() -> UIImage? {
            switch self {
            case .name:
                return UIImage(named: "person_user")
            case .location:
                return UIImage(named: "person_location")
            case .blog:
                return UIImage(named: "person_link")
            case .email:
                return UIImage(named: "person_mail")
            }
        }
    }

    init(type: type) {
        self.type = type
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupText(text: String) {
        titleLab.text = text
    }

    private lazy var titleIcon: UIImageView = {
        let iv = UIImageView()
        return iv
    }()

    private lazy var titleLab: UILabel = {
        let lab = UILabel()
        lab.textColor = .black
        lab.font = .systemFont(ofSize: 12)
        lab.textAlignment = .left
        return lab
    }()
}

extension PersonDetailView {
    private func setupView() {
        addSubview(titleIcon)
        titleIcon.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
            make.width.equalTo(titleIcon.snp.height)
        }
        titleIcon.image = self.type.getImage()
        addSubview(titleLab)
        titleLab.snp.makeConstraints { make in
            make.leading.equalTo(titleIcon.snp.trailing).offset(16)
            make.centerY.equalTo(titleIcon.snp.centerY)
        }
    }
}
