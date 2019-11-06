//
//  TabBarController.swift
//  Housefood
//
//  Created by Eric Hodgins on 2019/07/14.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.shadowImage = UIImage()
        self.tabBar.backgroundImage = UIImage()
    }

}

extension TabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.isKind(of: UserPostTab.self) {
            return false
        }
        return true
    }
}
