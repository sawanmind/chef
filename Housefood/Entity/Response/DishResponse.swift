//
//  DishResponse.swift
//  Housefood
//
//  Created by Eric Hodgins on 2019/07/07.
//  Copyright © 2019 Oluha. All rights reserved.
//

import Foundation
import ObjectMapper

class DishResponse: Mappable {
    var dish_id: String?
    var thumbnail_url: String!
    var name: String!
    var rating: String!
    var estimateTime: String!
    
    required convenience init?(map: Map) {
        self.init(map: map)
    }
    
    func mapping(map: Map) {
        dish_id <- map["dish_id"]
        thumbnail_url <- map["thumbnail_url"]
        name <- map["name"]
        rating <- map["rating"]
        estimateTime <- map["estimateTime"]
    }
}
