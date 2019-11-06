//
//  AccountSettingsTableViewController.swift
//  Housefood
//
//  Created by Oluha group on 8/23/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class AccountSettingsTableViewController: UITableViewController, IndicatorInfoProvider {
    
    var itemInfo = IndicatorInfo(title: "Account Settings")

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
        profileItemArray.append(MyProfileItem(icon: #imageLiteral(resourceName: "checkmark"), title: "Profile Edit", type: .ProfileEdit))
        profileItemArray.append(MyProfileItem(icon: nil, title: "Contract Support", type: .ContractSupport))
        profileItemArray.append(MyProfileItem(icon: nil, title: "Legal", type: .Legal))
        profileItemArray.append(MyProfileItem(icon: #imageLiteral(resourceName: "checkmark"), title: "Logout", type: .Logout))
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

}
