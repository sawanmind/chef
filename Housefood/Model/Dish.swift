//
//  Dish.swift
//  Housefood
//
//  Created by Eric Hodgins on 2019/07/05.
//  Copyright © 2019 Oluha. All rights reserved.
//

import Foundation
import UIKit
import RxDataSources

struct Dish {
    var dish_id: String
    var thumbnail_url: String
    var name: String
    var rating: String
    var estimateTime: String
}

extension Dish: Equatable, IdentifiableType {
    typealias Identity = String
    
    var identity: Identity {
        return self.dish_id
    }
    
    static func == (lhs: Dish, rhs: Dish) -> Bool {
        return lhs.dish_id == rhs.dish_id
    }
}

struct SectionOfDish {
    var header: String
    var items: [Item]
}

extension SectionOfDish: AnimatableSectionModelType {
    typealias Item = Dish
    
    var identity: String {
        return header
    }
    
    init(original: SectionOfDish, items: [SectionOfDish.Item]) {
        self = original
        self.items = items
    }
}
