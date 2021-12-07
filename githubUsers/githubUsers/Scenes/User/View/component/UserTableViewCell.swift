//
//  UserTableViewCell.swift
//  githubUsers
//
//  Created by Danny on 2021/12/7.
//

import UIKit
import SnapKit

class UserTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    public func setupUser(_ model: UserModel) {
        if let url = URL(string: model.avatarURL) {
            titleIcon.setKFImage(with: url)
        }
        titleLab.text = model.name
    }

    private func setupView() {
        contentView.addSubview(titleIcon)
        titleIcon.snp.makeConstraints { (make) in
            make.leading.top.equalTo(contentView).offset(12)
            make.bottom.equalTo(contentView).offset(-12)
            make.size.equalTo(CGSize(width: 50, height: 50))
        }

        contentView.addSubview(titleLab)
        titleLab.snp.makeConstraints { (make) in
            make.leading.equalTo(titleIcon.snp.trailing).offset(16)
            make.centerY.equalTo(titleIcon.snp.centerY)
        }
    }

    private lazy var titleIcon: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "tab_user_unselected"))
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 25
        return iv
    }()

    private lazy var titleLab: UILabel = {
        let lab = UILabel()
        lab.textColor = .black
        lab.font = .systemFont(ofSize: 16)
        lab.textAlignment = .left
        return lab
    }()
}
