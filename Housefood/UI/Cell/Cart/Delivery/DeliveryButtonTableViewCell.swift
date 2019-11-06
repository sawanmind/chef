//
//  DeliveryButtonTableViewCell.swift
//  Housefood
//
//  Created by Oluha group on 8/17/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

class DeliveryButtonTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var buttonClicked: (() -> ())?
    @IBOutlet weak var btnNext: ChefButton!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func btnClicked(_ sender: UIButton) {
        buttonClicked!()
    }
    
    func setButton(title: String) {
        btnNext.titleText = title
    }
}
