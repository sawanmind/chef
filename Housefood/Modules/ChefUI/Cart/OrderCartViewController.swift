//
//  OrderCartViewController.swift
//  Housefood
//
//  Created by Oluha group on 8/9/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class OrderCartViewController: ButtonBarPagerTabStripViewController {
    
    let graySpotifyColor = UIColor(red: 21/255.0, green: 21/255.0, blue: 24/255.0, alpha: 1.0)
    let darkGraySpotifyColor = UIColor(red: 19/255.0, green: 20/255.0, blue: 20/255.0, alpha: 1.0)

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
        let child_1 = OrderTabTableViewController(style: .plain, itemInfo: IndicatorInfo(title: "Order"))
        let child_2 = CustomOrderTabTableViewController(style: .plain, itemInfo: IndicatorInfo(title: "Custom Order"))
        let child_3 = DeliveryPendingTabTableViewController(style: .plain, itemInfo: IndicatorInfo(title: "Delivery Pending"))
        let child_4 = OrderStatusTabTableViewController(style: .plain, itemInfo: IndicatorInfo(title: "Order Status"))
        return [child_1, child_2, child_3, child_4]
    }

}
