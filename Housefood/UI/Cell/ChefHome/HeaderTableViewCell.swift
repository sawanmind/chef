//
//  HeaderTableViewCell.swift
//  Housefood
//
//  Created by Oluha group on 8/20/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var lblWaitingCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setWaitingCount(count: Int) {
        lblWaitingCount.text = "Waiting \(count)+"
    }
}
