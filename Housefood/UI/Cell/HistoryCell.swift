//
//  HistoryCell.swift
//  Housefood
//
//  Created by Oluh group on 2019/07/05.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

class HistoryCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var thumbnailView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func set(name: String, detail: String, status: String, thumbnail: UIImage) {
        nameLabel.text = name
        detailLabel.text = detail
        statusLabel.text = status
        thumbnailView.image = thumbnail
    }
}
