//
//  DeliveryPendingTabTableViewController.swift
//  Housefood
//
//  Created by Oluha group on 8/15/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class DeliveryPendingTabTableViewController: UITableViewController, IndicatorInfoProvider {
    
    var itemInfo = IndicatorInfo(title: NavBarTitle.OrderPending)
    fileprivate var foodItemArray = [FoodItem]()
    
    init(style: UITableView.Style, itemInfo: IndicatorInfo) {
        self.itemInfo = itemInfo
        super.init(style: style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        
        tableView.register(UINib(nibName: NibName.PendingDeliveryTableViewCell, bundle: nil), forCellReuseIdentifier: ReuseIdentifiers.PendingDeliveryTableViewCell)
        tableView.register(UINib(nibName: NibName.PendingDeliveryDriverPickupTableViewCell, bundle: nil), forCellReuseIdentifier: ReuseIdentifiers.PendingDeliveryDriverPickupTableViewCell)
        
        self.tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        
        setObjects()
    }
    
    func setObjects() {
        foodItemArray.append(FoodItem(imageUrl: "food2", price: 12.3, count: 3, name: "Grilled Salmon", type: 1))
        foodItemArray.append(FoodItem(imageUrl: "food1", price: 12.3, count: 3, name: "Grilled Salmon", type: 2))
        foodItemArray.append(FoodItem(imageUrl: "food4", price: 12.3, count: 2, name: "Chicken Burrito", type: 3))
        foodItemArray.append(FoodItem(imageUrl: "food4", price: 12.3, count: 2, name: "Chicken Burrito", type: 4))
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch foodItemArray[indexPath.row].type {
        case 1: return 135
        case 2: return 240
        case 3: return 180
        case 4: return 229
        default:return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodItemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if foodItemArray[indexPath.row].type == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.PendingDeliveryTableViewCell, for: indexPath) as! PendingDeliveryTableViewCell
            cell.setObject(item: foodItemArray[indexPath.row], isDelivery: false)
            cell.deleveryNowButtonDelegate = { item in
                self.pushToDelivery(item: item)
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.PendingDeliveryDriverPickupTableViewCell, for: indexPath) as! PendingDeliveryDriverPickupTableViewCell
            cell.setObject(type: foodItemArray[indexPath.row].type)
            cell.buttonClickDelegate = { (state) in
                self.buttonAction(state: state)
            }
            return cell
        }
    }
    
    fileprivate func pushToDelivery(item: FoodItem) {
        let storyboard = UIStoryboard(name: Storyboards.Delivery, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SelectDeliveryViewController") as! SelectDeliveryViewController
        vc.selectedItem = item
        self.present(vc, animated: true, completion: nil)
    }
    
    fileprivate func buttonAction(state: ButtonState) {
        switch state {
        case .ViewDetails: do {
            self.present(UIStoryboard(name: Storyboards.MapView, bundle: nil).instantiateInitialViewController()!, animated: true, completion: nil)
            }
        case .Cancel: do {
            
            }
        case .Done: do {
            
            }
        }
    }
}

