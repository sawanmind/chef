//
//  CustomSentOrderTableViewCell.swift
//  Housefood
//
//  Created by Oluha group on 8/24/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

class CustomSentOrderTableViewCell: UITableViewCell {

    @IBOutlet weak var imgProfile: RoundImage!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblFoodName: CustomUILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func btnWaitingClicked(_ sender: UIButton) {
    }
}
