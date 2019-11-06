//
//  Card.swift
//  Housefood
//
//  Created by Oluha group on 23/10/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import Foundation

struct Card: Codable {
    var number: String
    var expMonth: String
    var expYear: String
    var cvc: String
    
    
    enum CodingKeys: String, CodingKey {
        case expYear = "exp_year"
        case expMonth = "exp_month"
        case number
        case cvc
    }
}
