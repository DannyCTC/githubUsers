//
//  BaseNavigationController.swift
//  githubUsers
//
//  Created by Danny on 2021/12/6.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

}
