//
//  DeliveryAddressTableViewCell.swift
//  Housefood
//
//  Created by Oluha group on 8/17/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit
import MapKit

class DeliveryAddressTableViewCell: UITableViewCell {

    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
