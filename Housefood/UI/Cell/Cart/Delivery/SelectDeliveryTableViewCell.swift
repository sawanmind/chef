//
//  SelectDeliveryTableViewCell.swift
//  Housefood
//
//  Created by Oluha group on 8/16/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

class SelectDeliveryTableViewCell: UITableViewCell {

    @IBOutlet weak var btnDeliveryService: ChefButton!
    @IBOutlet weak var btnSelfDelivery: ChefButton!
    var isSelfSelected: ((Bool) -> ())?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func isSelfDelivery(isSelf: Bool) {
        btnSelfDelivery.backgroundColor = isSelf ? .red : .white
        btnDeliveryService.backgroundColor = isSelf ? .white : .red
        
        btnSelfDelivery.titleColor = isSelf ? .white : .black
        btnDeliveryService.titleColor = isSelf ? .black : .white
    }
    
    @IBAction func btnDeliveryServiceClicked(_ sender: UIButton) {
        isSelfSelected!(false)
    }
    
    @IBAction func btnSelfDeliveryClicked(_ sender: UIButton) {
        isSelfSelected!(true)
    }
}
