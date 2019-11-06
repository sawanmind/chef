//
//  CustomOrderTabTableViewController.swift
//  Housefood
//
//  Created by Oluha group on 8/15/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class CustomOrderTabTableViewController: UITableViewController, IndicatorInfoProvider {
    
    var itemInfo = IndicatorInfo(title: NavBarTitle.CustomOrder)

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
        
        tableView.register(UINib(nibName: NibName.CustomOrderTableViewCell, bundle: nil), forCellReuseIdentifier: ReuseIdentifiers.CustomOrderTableViewCell)
        tableView.register(UINib(nibName: NibName.CustomSentOrderTableViewCell, bundle: nil), forCellReuseIdentifier: ReuseIdentifiers.CustomSentOrderTableViewCell)

        self.tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 325
        } else {
            return 223
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.CustomOrderTableViewCell, for: indexPath) as! CustomOrderTableViewCell
            cell.buttonClicked = { () in
                self.showDetailsView()
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.CustomSentOrderTableViewCell, for: indexPath) as! CustomSentOrderTableViewCell
            return cell
        }
    }

    fileprivate func showDetailsView() {
        self.present(UIStoryboard(name: Storyboards.CustomOrderDetails, bundle: nil).instantiateInitialViewController()!, animated: true, completion: nil)
    }
}
