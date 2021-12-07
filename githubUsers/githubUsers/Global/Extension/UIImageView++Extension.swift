//
//  UIImageView++Extension.swift
//  githubUsers
//
//  Created by Danny on 2021/12/7.
//

import Foundation
import Kingfisher

extension UIImageView {

    func setKFImage(with url: URL) {
        kf.setImage(with: url, placeholder: UIImage(named: "tab_user_unselected"))
    }
}
