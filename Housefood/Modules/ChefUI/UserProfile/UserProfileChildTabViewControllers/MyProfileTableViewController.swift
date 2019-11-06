//
//  MyProfileTableViewController.swift
//  Housefood
//
//  Created by Oluha group on 8/23/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class MyProfileTableViewController: UITableViewController, IndicatorInfoProvider {

    var itemInfo = IndicatorInfo(title: "My Profile")

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

    fileprivate var profileItemArray = [MyProfileItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: NibName.UserProfileItemTableViewCell, bundle: nil), forCellReuseIdentifier: ReuseIdentifiers.UserProfileItemTableViewCell)
        self.tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        
        setObjects()
    }
    
    func setObjects() {
        profileItemArray.append(MyProfileItem(icon: #imageLiteral(resourceName: "checkmark"), title: "Status", type: .Status))
        profileItemArray.append(MyProfileItem(icon: #imageLiteral(resourceName: "checkmark"), title: "Payment", type: .Payment))
        profileItemArray.append(MyProfileItem(icon: #imageLiteral(resourceName: "checkmark"), title: "Cheffy Profile Edit", type: .CheffyProfileEdit))
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 46
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileItemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.UserProfileItemTableViewCell, for: indexPath) as! UserProfileItemTableViewCell
        cell.setObject(item: profileItemArray[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if profileItemArray[indexPath.row].type == .Payment {
            showPaymentView()
        }
    }
    
    fileprivate func showPaymentView() {
        self.present(UIStoryboard(name: Storyboards.Payment, bundle: nil).instantiateInitialViewController()!, animated: true, completion: nil)
    }
}

struct MyProfileItem {
    var icon: UIImage?
    var title: String
    var type: MyProfileItemType
}
