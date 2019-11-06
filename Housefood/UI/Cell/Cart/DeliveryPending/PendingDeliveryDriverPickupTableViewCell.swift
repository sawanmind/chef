//
//  PendingDeliveryDriverPickupTableViewCell.swift
//  Housefood
//
//  Created by Oluha group on 8/22/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

class PendingDeliveryDriverPickupTableViewCell: UITableViewCell {

    @IBOutlet weak var lblFoodName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblEta: UILabel!
    @IBOutlet weak var lblDriverStatus: UILabel!
    @IBOutlet var imgFoodItem: UIImageView!
    @IBOutlet weak var buttonViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var btnDriverPickup: ChefButton!
    
    var buttonClickDelegate: ((ButtonState) -> ())?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setObject(type: Int) {
        if type == 2 {
            buttonViewHeightConstraint.constant = 64
            btnDriverPickup.isHidden = false
            btnDriverPickup.titleText = Strings.DriverPickup
            lblDriverStatus.text = Strings.DriverComing
        } else if type == 3 {
            buttonViewHeightConstraint.constant = 0
            btnDriverPickup.isHidden = true
            lblDriverStatus.text = Strings.UserWaiting
        } else if type == 4 {
            buttonViewHeightConstraint.constant = 64
            btnDriverPickup.isHidden = false
            btnDriverPickup.titleText = Strings.CompleteOrder
            lblDriverStatus.text = Strings.UserReceivedOrder
        }
    }
    
    @IBAction func btnViewDetailesClicked(_ sender: UIButton) {
        buttonClickDelegate!(.ViewDetails)
    }
    
    @IBAction func btnCancelClicked(_ sender: UIButton) {
        buttonClickDelegate!(.Cancel)
    }
    
    @IBAction func btnDriverPickupClicked(_ sender: UIButton) {
        buttonClickDelegate!(.Done)
    }
}

enum ButtonState {
    case ViewDetails
    case Cancel
    case Done
}
