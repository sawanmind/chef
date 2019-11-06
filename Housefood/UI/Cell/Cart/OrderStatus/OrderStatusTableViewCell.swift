//
//  OrderStatusTableViewCell.swift
//  Housefood
//
//  Created by Oluha group on 8/22/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

class OrderStatusTableViewCell: UITableViewCell {

    @IBOutlet var imgFoodItem: UIImageView!
    @IBOutlet var lblFoodName: UILabel!
    @IBOutlet var lblPrice: UILabel!
    @IBOutlet var lblStatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setObject(item: FoodItem) {
        imgFoodItem.image = UIImage(named: item.imageUrl)
        lblFoodName.text  = item.name
        lblPrice.text     = "$\(item.price)"
    }
}
