//
//  PendingDeliveryTableViewCell.swift
//  Housefood
//
//  Created by Oluha group on 8/16/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

class PendingDeliveryTableViewCell: UITableViewCell {

    @IBOutlet var imgFoodItem: UIImageView!
    @IBOutlet var lblFoodName: UILabel!
    @IBOutlet var lblPrice: UILabel!
    @IBOutlet var lblEta: UILabel!
    @IBOutlet var lblCarryOutByCustomer: UILabel!
    @IBOutlet weak var btnDeliveryNow: ChefButton!
    
    var deleveryNowButtonDelegate: ((FoodItem) -> ())?
    fileprivate var currentItem : FoodItem?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setObject(item: FoodItem, isDelivery: Bool) {
        currentItem = item
        imgFoodItem.image = UIImage(named: item.imageUrl)
        lblFoodName.text  = item.name
        lblPrice.text     = "$\(item.price)"
        lblEta.text     = "\(item.count)"
        if isDelivery {
            lblCarryOutByCustomer.isHidden = true
            btnDeliveryNow.isHidden = true
        }
    }
    
    @IBAction func btnDeliverNowClicked(_ sender: UIButton) {
        deleveryNowButtonDelegate?(currentItem!)
    }
}
