//
//  FavouriteViewModel.swift
//  Housefood
//
//  Created by Eric Hodgins on 2019/07/15.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit
import RealmSwift
import RxCocoa

class FavouriteTabModel: NSObject {

    let realm = try! Realm()
    
    var favourites: Results<FavouriteObject>!
    
    let favouriteObserver = BehaviorRelay(value: [Favourite]())
    
    override init() {
        super.init()
        getFavourites()
    }
    
    func getFavourites() {
        favourites = try! Realm().objects(FavouriteObject.self)
    }
}
