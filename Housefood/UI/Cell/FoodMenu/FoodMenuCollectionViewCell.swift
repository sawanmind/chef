//
//  FoodMenuCollectionViewCell.swift
//  Housefood
//
//  Created by Oluha group on 8/3/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

class FoodMenuCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgFoodMenu: UIImageView!
    @IBOutlet weak var lblMenuTitle: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet var btnAvailability: RoundButton!
    @IBOutlet var btnFavourite: UIButton!
    @IBOutlet weak var viewImageCover: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewImageCover.layer.shadowColor = UIColor.black.cgColor
        viewImageCover.layer.shadowOffset = CGSize(width: 1, height: 1)
        viewImageCover.layer.shadowRadius = 5
        viewImageCover.layer.shadowOpacity = 0.7
        viewImageCover.layer.cornerRadius = 5

        btnFavourite.setImage(#imageLiteral(resourceName: "Favorite_border24pt"), for: .normal)
        btnFavourite.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }

    @IBAction func btnClickedFavourite(_ sender: UIButton) {
        
    }
    
    @IBAction func btnClickedAvailability(_ sender: UIButton) {
        
    }
    
    func setObject(item: MenuOrder) {
        imgFoodMenu.image = item.imgOrder
        lblMenuTitle.text = item.orderTitle
        lblRating.text    = "\(item.rating)"
        lblTime.text      = "\(item.eta)"
        lblType.text      = item.status
    }
}
