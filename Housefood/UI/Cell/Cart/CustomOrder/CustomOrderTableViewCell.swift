//
//  CustomOrderTableViewCell.swift
//  Housefood
//
//  Created by Oluha group on 8/17/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

class CustomOrderTableViewCell: UITableViewCell {

    @IBOutlet weak var imgProfile: RoundImage!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblFoodName: CustomUILabel!
    @IBOutlet weak var lblFoodDescription: CustomUILabel!
    
    var buttonClicked: (() -> ())?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func btnAcceptClicked(_ sender: UIButton) {
    
    }
    
    @IBAction func btnRejectClicked(_ sender: UIButton) {
    
    }
    
    @IBAction func btnDetailsClicked(_ sender: UIButton) {
        buttonClicked!()
    }
}
