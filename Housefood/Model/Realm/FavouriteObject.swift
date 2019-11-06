//
//  Favourite.swift
//  Housefood
//
//  Created by Eric Hodgins on 2019/07/11.
//  Copyright © 2019 Oluha. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers
class FavouriteObject: Object {
    dynamic var resId: String!
    dynamic var name: String!
    dynamic var address: String!
    dynamic var phone: Int!
    dynamic var status: Int!
    dynamic var thumbnail_url: String!
    
    override static func primaryKey() -> String? {
        return "resId"
    }
}
