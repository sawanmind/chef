//
//  RestaurantResponse.swift
//  Housefood
//
//  Created by Eric Hodgins on 2019/07/13.
//  Copyright © 2019 Oluha. All rights reserved.
//

import Foundation
import ObjectMapper

class RestaurantResponse: Mappable {
    
    var name: String?
    var address: String?
    var phone: Int?
    var status: Int?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        address <- map["address"]
        phone <- map["phone"]
        status <- map["status"]
    }
}
