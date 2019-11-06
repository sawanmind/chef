//
//  DeliveryDetailsViewController.swift
//  Housefood
//
//  Created by Oluha group on 8/16/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

class DeliveryDetailsViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    var selectedItem : FoodItem?
    
    fileprivate let RowHeightAddress = 200.0
    fileprivate let RowHeightFoodItem = 125.0
    fileprivate let RowHeightButton = 207.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.title = "";
        self.setTableView()
    }

    fileprivate func setTableView() {
        tblView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)

        tblView.register(UINib(nibName: NibName.PendingDeliveryTableViewCell, bundle: nil), forCellReuseIdentifier: ReuseIdentifiers.PendingDeliveryTableViewCell)
        tblView.register(UINib(nibName: NibName.DeliveryButtonTableViewCell, bundle: nil), forCellReuseIdentifier: ReuseIdentifiers.DeliveryButtonTableViewCell)
        tblView.register(UINib(nibName: NibName.DeliveryAddressTableViewCell, bundle: nil), forCellReuseIdentifier: ReuseIdentifiers.DeliveryAddressTableViewCell)
    }
}

extension DeliveryDetailsViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.DeliveryAddressTableViewCell, for: indexPath) as! DeliveryAddressTableViewCell
            return cell

        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.PendingDeliveryTableViewCell, for: indexPath) as! PendingDeliveryTableViewCell
            if let item = selectedItem {
                cell.setObject(item: item, isDelivery: true)
            }
            return cell

        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.DeliveryButtonTableViewCell, for: indexPath) as! DeliveryButtonTableViewCell
            cell.setButton(title: Strings.Confirm)
            cell.buttonClicked = { () in
                self.popToTableView()
            }
            return cell
        }
    }
    
    fileprivate func popToTableView() {
//        self.navigationController?.popToRootViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
}

extension DeliveryDetailsViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return CGFloat(RowHeightAddress)
        } else if indexPath.row == 1 {
            return CGFloat(RowHeightFoodItem)
        } else {
            return CGFloat(RowHeightButton)
        }
    }

}
