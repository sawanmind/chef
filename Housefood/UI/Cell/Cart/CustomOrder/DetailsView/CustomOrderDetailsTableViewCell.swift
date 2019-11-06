//
//  CustomOrderDetailsTableViewCell.swift
//  Housefood
//
//  Created by Oluha group on 8/24/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

class CustomOrderDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var imgProfile: RoundImage!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblFoodName: CustomUILabel!
    @IBOutlet weak var lblFoodDescription: CustomUILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setObject() {
        imgProfile.image = #imageLiteral(resourceName: "tim")
        lblName.text = "Pabilis"
        lblFoodName.text = "Ckicken Buriani"
        lblFoodDescription.text = "Chicken biriyani is a traditional indian food which is really tasty.I need it custom cooked for me with more eggs with chicken"
    }
    
    @IBAction func btnAcceptClicked(_ sender: UIButton) {
    }
    
    @IBAction func btnRejectClicked(_ sender: UIButton) {
    }
}
