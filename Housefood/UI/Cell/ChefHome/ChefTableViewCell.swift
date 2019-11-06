//
//  ChefTableViewCell.swift
//  Housefood
//
//  Created by Oluha group on 7/28/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

class ChefTableViewCell: UITableViewCell {

    @IBOutlet var imgFoodItem: UIImageView!
    @IBOutlet var lblFoodName: UILabel!
    @IBOutlet var lblPrice: UILabel!
    @IBOutlet var lblCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setObject(item: OrderResponse) {
        imgFoodItem.image = UIImage(named: "food4")
        lblFoodName.text  = item.name
        lblPrice.text     = "$\(item.price ?? 0)"
        lblCount.text     = "\(item.count ?? 0)"
    }
    
    func setObject(item: FoodItem) {
        imgFoodItem.image = UIImage(named: item.imageUrl)
        lblFoodName.text  = item.name
        lblPrice.text     = "$\(item.price)"
        lblCount.text     = "\(item.count)"
    }
    
    @IBAction func btnClickAccepted(_ sender: UIButton) {
    
    }
    
    @IBAction func btnClickRejected(_ sender: UIButton) {
        
    }
}
