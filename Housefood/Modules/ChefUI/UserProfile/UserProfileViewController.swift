//
//  UserProfileViewController.swift
//  Housefood
//
//  Created by Oluha group on 8/23/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class UserProfileViewController: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        // change selected bar color
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.selectedBarBackgroundColor = UIColor.init(hexString: "#EA1D2C")
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
        settings.style.selectedBarHeight = 2.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .black
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .gray
            newCell?.label.textColor = UIColor.init(hexString: "#EA1D2C")
        }
        
        self.navigationController?.navigationBar.shadowImage = UIImage()

        super.viewDidLoad()
    }

    // MARK: - PagerTabStripDataSource
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child_1 = MyProfileTableViewController(style: .plain, itemInfo: IndicatorInfo(title: "My Profile"))
        let child_2 = AccountSettingsTableViewController(style: .plain, itemInfo: IndicatorInfo(title: "Account Settings"))
        return [child_1, child_2]
    }

}

enum MyProfileItemType {
    case Status
    case Payment
    case CheffyProfileEdit
    case ProfileEdit
    case ContractSupport
    case Legal
    case Logout
}
