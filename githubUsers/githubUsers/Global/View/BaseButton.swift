//
//  BaseButton.swift
//  githubUsers
//
//  Created by Danny on 2021/12/7.
//

import Foundation
import UIKit

final class BaseButton: UIButton {
    public var click: (() -> ())?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addTarget(self, action: #selector(pressed), for: .touchUpInside)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(imageName: String? = nil) {
        self.init(frame: .zero)
        if let imageName = imageName {
            self.setImage(UIImage(named: imageName), for: .normal)
            self.imageView?.contentMode = .scaleAspectFit
        }
    }

    convenience init(title: String,
                     imageName: String? = nil,
                     semantic: UISemanticContentAttribute = .forceLeftToRight) {
        self.init(frame: .zero)
        if let imageName = imageName {
            self.setImage(UIImage(named: imageName), for: .normal)
            self.imageView?.contentMode = .scaleAspectFit
            self.semanticContentAttribute = semantic
            let offset: CGFloat = (self.semanticContentAttribute == .forceLeftToRight) ? 8.0 : -8.0
            self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: offset)
        }
        self.setTitle(title, for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = .clear
    }

    @objc private func pressed(sender: UIButton) {
        click?()
    }
}
