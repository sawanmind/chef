//
//  UserProfileItemTableViewCell.swift
//  Housefood
//
//  Created by Oluha group on 8/24/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

class UserProfileItemTableViewCell: UITableViewCell {

    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imageWidthConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setObject(item: MyProfileItem) {
        if let image = item.icon {
            imageWidthConstraint.constant = 30
            imgIcon.image = image
        } else {
            imageWidthConstraint.constant = 0
        }
        lblTitle.text = item.title
    }
}
