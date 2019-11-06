//
//  FavouriteManager.swift
//  Housefood
//
//  Created by Eric Hodgins on 2019/07/14.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit
import RealmSwift

class FavouriteManager: NSObject {

    static let shared = FavouriteManager()
    
    let realm = try! Realm()
    
    func addToFavourite(resid: String, name: String, address: String, phone: Int, status: Int, thumbnail_url: String) {
        let favourite = Favourite()
        
    }
}
