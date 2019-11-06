//
//  PaymentViewController.swift
//  Housefood
//
//  Created by Oluha group on 8/29/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {

    @IBOutlet weak var constraintPaymentMethodTableHeight: NSLayoutConstraint!
    @IBOutlet weak var tblPaymentMethods: UITableView!

    let addRowCellHeight = 75
    private var paymentMethodArray = [PaymentMethod]()

    @IBOutlet weak var btnGetPaymentNow: ChefButton!
    @IBOutlet weak var lblTotalBalance: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblPaymentMethods.register(UINib(nibName: NibName.PaymentMethodTableViewCell, bundle: nil), forCellReuseIdentifier: ReuseIdentifiers.PaymentMethodTableViewCell)
        
        setIngredientTableHeight()
    }

    fileprivate func setIngredientTableHeight() {
        constraintPaymentMethodTableHeight.constant = CGFloat(addRowCellHeight * paymentMethodArray.count)
    }

    @IBAction func btnAddBankAccountClicked(_ sender: UIButton) {
        paymentMethodArray.append(PaymentMethod(name: "Amex", date: ""))
        setIngredientTableHeight()
        tblPaymentMethods.reloadData()
    }
    
    @IBAction func btnGetPaymentNowClicked(_ sender: UIButton) {
        
    }
}


extension PaymentViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paymentMethodArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.PaymentMethodTableViewCell, for: indexPath) as! PaymentMethodTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(addRowCellHeight)
    }
}

extension PaymentViewController : UITableViewDelegate {
    
}

struct PaymentMethod {
    var name: String
    var date: String
}
