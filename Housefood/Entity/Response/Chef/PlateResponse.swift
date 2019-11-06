//
//  DishResponse.swift
//  Housefood
//
//  Created by Oluha group on 8/20/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit
import ObjectMapper

class PlateResponse: Mappable {
    var id: Int = 0
    var name: String?
    var description: String?
    var price: Int?
    var delivery_time: Int?
    var sell_count: Int?
    var PlateImages: [PlateImage]?

    required convenience init?(map: Map) {
        self.init(map: map)
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        description <- map["description"]
        price <- map["price"]
        delivery_time <- map["delivery_time"]
        sell_count <- map["sell_count"]
        PlateImages <- map["PlateImages"]
    }

}
