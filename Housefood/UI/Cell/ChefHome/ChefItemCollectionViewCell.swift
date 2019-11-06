//
//  ChefItemCollectionViewCell.swift
//  Housefood
//
//  Created by Oluha group on 7/28/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit
import AlamofireImage

class ChefItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imgFoodItem: UIImageView!
    @IBOutlet var lblFoodItem: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setObject(item: Plate) {
        if let imgUrl = item.PlateImages?.first?.url {
            imgFoodItem!.af_setImage(
                withURL: URL(string: imgUrl)!,
                placeholderImage: UIImage(named: "defaultPlateImage"),
                filter: AspectScaledToFillSizeFilter(size: imgFoodItem.frame.size)
            )
        } else {
            imgFoodItem.image = UIImage(named: "defaultPlateImage")
        }
        lblFoodItem.text = item.name
    }
}
