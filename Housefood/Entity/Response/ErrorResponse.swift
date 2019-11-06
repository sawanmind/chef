//
//  ErrorResponse.swift
//  Housefood
//
//  Created by Eric Hodgins on 2019/07/17.
//  Copyright © 2019 Oluha. All rights reserved.
//

import Foundation
import ObjectMapper

class ErrorResponse: Mappable {
    var message: String!
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        message <- map["msg"]
    }
}



