//
//  CustomOrderDetailsViewController.swift
//  Housefood
//
//  Created by Oluha group on 8/24/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

class CustomOrderDetailsViewController: UIViewController {

    @IBOutlet weak var tblCustomOrderDetails: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblCustomOrderDetails.register(UINib(nibName: NibName.CustomOrderDetailsTableViewCell, bundle: nil), forCellReuseIdentifier: ReuseIdentifiers.CustomOrderDetailsTableViewCell)
    }

}

extension CustomOrderDetailsViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.CustomOrderDetailsTableViewCell, for: indexPath) as! CustomOrderDetailsTableViewCell
        cell.setObject()
        return cell
    }
    
}

extension CustomOrderDetailsViewController : UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 500
//    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
