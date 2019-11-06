//
//  FoodImageTableViewCell.swift
//  Housefood
//
//  Created by Oluha group on 8/3/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

class FoodImageTableViewCell: UITableViewCell {

    @IBOutlet weak var lblPhotoType: UILabel!
    @IBOutlet weak var imgIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setObject(item: PhotoItem) {
        lblPhotoType.text   = item.title
        imgIcon.image       = item.image
    }
}
