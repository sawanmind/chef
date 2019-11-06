//
//  HomeCell.swift
//  Housefood
//
//  Created by Eric Hodgins on 2019/07/05.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit
import AlamofireImage

class DishCell: UITableViewCell {

    @IBOutlet weak var thumbnailView: UIImageView!
    @IBOutlet weak var dishInfoView: UIView!
    @IBOutlet weak var dishNameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(thumbnail_url: String, name: String, rating: String, time: String) {
        dishNameLabel.text = name
        ratingLabel.text = rating
        timeLabel.text = time
        thumbnailView!.af_setImage(
            withURL: URL(string: thumbnail_url)!,
            placeholderImage: UIImage(named: "Dish24ot"),
            filter: AspectScaledToFillSizeFilter(size: thumbnailView.frame.size)
        )
    }
    
    func hideDishInfo() {
        dishInfoView.isHidden = false
    }
    
    func showDishInfo() {
        dishInfoView.isHidden = true
    }
    
    @IBAction func favouriteClick(_ sender: Any) {
        
    }
}
