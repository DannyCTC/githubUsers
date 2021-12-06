//
//  MainTabBarController.swift
//  githubUsers
//
//  Created by Danny on 2021/12/6.
//

import Foundation
import UIKit

enum MainTabBarItem {
    case home, mine

    var title: String {
        switch self {
        case .home:
            return "User"
        case .mine:
            return "Mine"
        }
    }

    var unSelectedImage: UIImage? {
        switch self {
        case .home:
            return UIImage(named: "tab_user_selected")
        case .mine:
            return UIImage(named: "tab_mine_selected")
        }
    }

    var selectedImage: UIImage? {
        switch self {
        case .home:
            return UIImage(named: "tab_user_unselected")
        case .mine:
            return UIImage(named: "tab_mine_unselected")
        }
    }

    var indexValue: Int {
        switch self {
        case .home:
            return 0
        case .mine:
            return 1
        }
    }
}

class MainTabBarController: UITabBarController {

    var homeVC: BaseNavigationController!
    private var minVC: BaseNavigationController!

    override func viewDidLoad() {
        super.viewDidLoad()
        initStyle()
        initVC()
        showViewControllers()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    func initStyle() {
        view.backgroundColor = .white
        tabBar.isTranslucent = false
        tabBar.barStyle = .black

        let appearance = UITabBarAppearance()
        let normalColor = UIColor.lightGray
        let selectedColor = UIColor.black
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: normalColor]
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: selectedColor]

        tabBar.standardAppearance = appearance
        tabBar.standardAppearance.backgroundColor = .white
    }

    func initVC() {
        homeVC = childVC(UserViewController(), .home)
        minVC = childVC(MineViewController(), .mine)
    }

    func showViewControllers() -> Void {
        viewControllers = [homeVC, minVC]
    }

    private func childVC(_ childVC: UIViewController,
                         _ tabType: MainTabBarItem) -> BaseNavigationController{

        // 设置UITabBarItem的文字属性
        childVC.tabBarItem = UITabBarItem.init(title: tabType.title, image: tabType.selectedImage?.withRenderingMode(.alwaysOriginal), selectedImage:  tabType.unSelectedImage?.withRenderingMode(.alwaysOriginal))

        // tabBar icon text 位置
        var tabBarTextOffset: CGFloat = -5
        if iPhoneXAbove {
            childVC.tabBarItem.imageInsets.bottom = -15
            tabBarTextOffset = 5
        }

        if #available(iOS 13, *) {
            // 讓tabBar Label 置中
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = NSTextAlignment.center
            childVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.paragraphStyle: paragraphStyle, NSAttributedString.Key.baselineOffset: 10], for: .normal)

            // 調整tab icon text 位置
            let appearance = self.tabBar.standardAppearance.copy()
            appearance.stackedLayoutAppearance.normal.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: tabBarTextOffset)
            appearance.stackedLayoutAppearance.selected.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: tabBarTextOffset)
            childVC.tabBarItem.standardAppearance = appearance
        } else {
            if iPhoneXAbove {
                childVC.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: tabBarTextOffset)
            }
        }

        let nav = BaseNavigationController.init(rootViewController: childVC)

        return nav

    }
}

extension MainTabBarController{

    func routeToIndexOfPage(type: MainTabBarItem) {
        selectedIndex = type.indexValue
    }
}
