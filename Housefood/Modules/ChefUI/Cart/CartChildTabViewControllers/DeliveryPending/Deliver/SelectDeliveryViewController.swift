//
//  SelectDeliveryViewController.swift
//  Housefood
//
//  Created by Oluha group on 8/16/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

class SelectDeliveryViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    var selectedItem : FoodItem?
    fileprivate var isSelfDelivery = true
    
    fileprivate let RowHeightFoodItem = 140.0
    fileprivate let RowHeightButton = 207.0
    fileprivate let RowHeightTypeSelect = 134.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.title = "";
        self.setTableView()
    }
    
    fileprivate func setTableView() {
        tblView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)

        tblView.register(UINib(nibName: NibName.PendingDeliveryTableViewCell, bundle: nil), forCellReuseIdentifier: ReuseIdentifiers.PendingDeliveryTableViewCell)
        tblView.register(UINib(nibName: NibName.SelectDeliveryTableViewCell, bundle: nil), forCellReuseIdentifier: ReuseIdentifiers.SelectDeliveryTableViewCell)
        tblView.register(UINib(nibName: NibName.DeliveryButtonTableViewCell, bundle: nil), forCellReuseIdentifier: ReuseIdentifiers.DeliveryButtonTableViewCell)
    }
}

extension SelectDeliveryViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.PendingDeliveryTableViewCell, for: indexPath) as! PendingDeliveryTableViewCell
            if let item = selectedItem {
                cell.setObject(item: item, isDelivery: true)
            }
            return cell

        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.SelectDeliveryTableViewCell, for: indexPath) as! SelectDeliveryTableViewCell
            cell.isSelfDelivery(isSelf: isSelfDelivery)
            cell.isSelfSelected = { isSelf in
                self.isSelfDelivery = isSelf
                self.tblView.reloadData()
            }
            return cell

        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.DeliveryButtonTableViewCell, for: indexPath) as! DeliveryButtonTableViewCell
            if isSelfDelivery {
                cell.setButton(title: Strings.Next)
                cell.tag = 1
            } else {
                cell.setButton(title: Strings.RequestDriver)
                cell.tag = 2
            }
            cell.buttonClicked = { () in
                if cell.tag == 1 {
                    self.pushToAddressView()
                } else {
                    self.pushToTableView()
                }
            }
            return cell
        }
    }

    fileprivate func pushToAddressView() {
        self.performSegue(withIdentifier: NamedSegues.SegueFromDeliveryToAddress, sender: nil)
    }
    
    fileprivate func pushToTableView() {
        //self.navigationController?.popToRootViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let deliveryDetailsVC: DeliveryDetailsViewController = segue.destination as? DeliveryDetailsViewController {
            deliveryDetailsVC.selectedItem = selectedItem
        }
    }
    
}

extension SelectDeliveryViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return CGFloat(RowHeightFoodItem)
        } else if indexPath.row == 1 {
            return CGFloat(RowHeightTypeSelect)
        } else {
            return CGFloat(RowHeightButton)
        }
    }
}
