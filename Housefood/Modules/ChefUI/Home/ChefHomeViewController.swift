//
//  ChefHomeViewController.swift
//  Housefood
//
//  Created by Oluha group on 7/28/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

class ChefHomeViewController: UIViewController {

    @IBOutlet var tableViewChef: UITableView!
    @IBOutlet weak var btnViewAllOrderRequest: ChefButton!
    
    fileprivate var platesArray = [Plate]()
    fileprivate var orderRequestsArray = [OrderResponse]()
    
    fileprivate var viewModel = ChefHomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewChef.register(UINib(nibName: NibName.ChefTableViewCell, bundle: nil), forCellReuseIdentifier: ReuseIdentifiers.ChefTableViewCell)
        tableViewChef.register(UINib(nibName: NibName.YourFoodsTableViewCell, bundle: nil), forCellReuseIdentifier: ReuseIdentifiers.YourFoodsTableViewCell)

        setObjects()
        navigationBar()
    }
        
    func navigationBar() {
        let longTitleLabel = UILabel()
        longTitleLabel.text = Strings.WhatWouldYouLike
        longTitleLabel.sizeToFit()
        
        let leftItem = UIBarButtonItem(customView: longTitleLabel)
        self.navigationItem.leftBarButtonItem = leftItem
        
        let notificationButton = BadgeButton()
        notificationButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        notificationButton.setImage(#imageLiteral(resourceName: "bell"), for: .normal)
        notificationButton.badgeEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 15)
        notificationButton.badge = "4"
        notificationButton.badgeTextColor = UIColor.white
        notificationButton.imageView?.tintColor = UIColor.black
        notificationButton.addTarget(self, action: #selector(notificationView(sender:)), for: UIControl.Event.touchUpInside)
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: notificationButton)
    }
    
    @objc func notificationView(sender: UIBarButtonItem) {
        self.present(UIStoryboard(name: Storyboards.ChefNotification, bundle: nil).instantiateInitialViewController()!, animated: true, completion: nil)
    }

    @IBAction func btnClickViewAllOrderRequests(_ sender: UIButton) {
        setObjects()
    }
    
    fileprivate func setObjects() {
        viewModel.getPlates(callback: self)
        viewModel.getOrderRequests(callback: self)
    }
    
    fileprivate func showAddFood() {
        self.present(UIStoryboard(name: Storyboards.AddFood, bundle: nil).instantiateInitialViewController()!, animated: true, completion: nil)
    }
}

extension ChefHomeViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return orderRequestsArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.YourFoodsTableViewCell, for: indexPath) as! YourFoodsTableViewCell
            cell.setObjects(items: platesArray)
            cell.addFoodClicked = { () in
                self.showAddFood()
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.ChefTableViewCell, for: indexPath) as! ChefTableViewCell
            cell.setObject(item: orderRequestsArray[indexPath.row])
            return cell
        }
    }
    
}

extension ChefHomeViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 240
        } else {
            return 123
        }
    }
    
    //For the order requests waiting count header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.HeaderTableViewCell) as! HeaderTableViewCell
        cell.setWaitingCount(count: orderRequestsArray.count)
        return cell.contentView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        } else {
            return 55
        }
    }
}

extension ChefHomeViewController : UIGetPlatesDelegate {
    
    func onGetPlatesSuccess(items: [Plate]) {
        platesArray = items
        tableViewChef.reloadData()
    }
    
    func onGetPlatesFailed(reason: String) {
        print(reason)
    }
}

extension ChefHomeViewController : UIGetOrderRequestDelegate {

    func onGetOrderRequestSuccess(items: [OrderResponse]) {
        orderRequestsArray = items
        tableViewChef.reloadData()
    }
    
    func onGetOrderRequestFailed(reason: String) {
        print(reason)
    }
}

struct FoodItem {
    var imageUrl: String
    var price: Double
    var count: Int
    var name: String
    var type: Int
}
