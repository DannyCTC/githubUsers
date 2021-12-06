//
//  Macros.swift
//  githubUsers
//
//  Created by Danny on 2021/12/6.
//

import UIKit

// MARK: - 屏幕尺寸
let kScreenH: CGFloat = UIScreen.main.bounds.size.height
let kScreenW: CGFloat = UIScreen.main.bounds.size.width

// MARK: - 屏幕适配
let kNavigationbarHeight:  CGFloat = 44.0
let kSafeAreaStatusHeight: CGFloat = kScreenH >= 812.0 ? 44.0: 20.0
let kSafeAreaBottomHeight: CGFloat = kScreenH >= 812.0 ? 34.0 : 0.0
let kSafeAreaTopHeight:    CGFloat = kSafeAreaStatusHeight + kNavigationbarHeight
let kSafeTabBarHeight:     CGFloat = kScreenH >= 812.0 ? 83 : 49

var iPhoneXAbove: Bool {
    return kScreenH >= 812.0
}
