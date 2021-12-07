//
//  UserView.swift
//  githubUsers
//
//  Created by Danny on 2021/12/7.
//

import UIKit
import SnapKit

class UserView: BaseView {
    var userClick: ((_ user: UserModel) -> ())?
    private var users: [UserModel] = []

    override func setup() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func initSetupSubviews() {
        addSubview(tableView)
    }

    override func makeSubviewConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }

    /// 設置視圖關聯關係
    override func setupOutlets(owner: AnyObject?) {
        super.setupOutlets(owner: owner)
        if let vc = owner as? UserViewController {
            vc.view = self
        }
    }

    public func setupContents(users: [UserModel]) -> Void {
        self.tableView.separatorStyle = .singleLine
        self.users = users
        self.tableView.reloadData()
    }

    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.separatorStyle = .none
        tv.backgroundColor = .white
        tv.register(UserTableViewCell.self, forCellReuseIdentifier: "UserTableViewCell")
        tv.showsHorizontalScrollIndicator = false
        tv.showsVerticalScrollIndicator = false
        return tv
    }()
}

extension UserView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = users[indexPath.row]
        userClick?(data)
    }
}

extension UserView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        let data = users[indexPath.row]

        cell.setupUser(data)

        return cell
    }


}
