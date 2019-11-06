//
//  Plate.swift
//  Housefood
//
//  Created by Oluha group on 8/20/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

class Plate: Codable {
    var id: Int
    var name: String?
    var description: String?
    var price: Int?
    var delivery_time: Int?
    var sell_count: Int?
    var PlateImages: [PlateImage]?
}

class PlateImage: Codable {
    var name: String?
    var url: String?
}
