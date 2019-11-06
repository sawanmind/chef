//
//  OrderTabTableViewController.swift
//  Housefood
//
//  Created by Oluha group on 8/15/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class OrderTabTableViewController: UITableViewController, IndicatorInfoProvider {
    
    var itemInfo = IndicatorInfo(title: NavBarTitle.Order)
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
        
        tableView.register(UINib(nibName: NibName.ChefTableViewCell, bundle: nil), forCellReuseIdentifier: ReuseIdentifiers.ChefTableViewCell)
        self.tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        
        setObjects()
    }
    
    func setObjects() {
        foodItemArray.append(FoodItem(imageUrl: "food2", price: 12.3, count: 3, name: "Grilled Salmon", type: 1))
        foodItemArray.append(FoodItem(imageUrl: "food1", price: 12.3, count: 3, name: "Grilled Salmon", type: 1))
        foodItemArray.append(FoodItem(imageUrl: "food2", price: 56.45, count: 3, name: "Nikan Salmon", type: 1))
        foodItemArray.append(FoodItem(imageUrl: "food3", price: 22.2, count: 3, name: "Mason Grilled Chicken", type: 1))
        foodItemArray.append(FoodItem(imageUrl: "food4", price: 98.99, count: 3, name: "Sandwitch kebab", type: 1))
        foodItemArray.append(FoodItem(imageUrl: "food2", price: 0.99, count: 3, name: "Chiken Pilau", type: 1))
        foodItemArray.append(FoodItem(imageUrl: "food1", price: 66.0, count: 3, name: "Noodles", type: 1))
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodItemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.ChefTableViewCell, for: indexPath) as! ChefTableViewCell
        cell.setObject(item: foodItemArray[indexPath.row])
        
        return cell
    }
    
}

