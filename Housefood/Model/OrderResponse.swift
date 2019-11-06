//
//  OrderResponse.swift
//  Housefood
//
//  Created by Oluha group on 8/20/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit
//Use classes to parse datas consume more memory
class OrderResponse: Codable {
    var id: Int
    var name: String?
    var price: Int?
    var count: Int?
}

//Use struct safe memory and create statycs objects
struct OrderPayment: Codable {
    var shippingId: Int
    var card: Card
    //To use good plactices here i Coding to use camelcase
    enum CodingKeys: String, CodingKey {
        case shippingId = "shipping_id"
        case card
    }
}
