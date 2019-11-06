//
//  AddFoodViewModel.swift
//  Housefood
//
//  Created by Oluha group on 8/31/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import Foundation

protocol UIAddFoodDelegate {
    func onAddFoodSuccess()
    func onAddFoodFailed(reason: String)
}

class AddFoodViewModel {
    
    var newPlate = FoodDetails()
    
    func getPlates(callback: UIAddFoodDelegate) {
        APIManager.shared.postaFood(plate: newPlate) { (isSuccess, errorMessage) in
            if isSuccess {
                callback.onAddFoodSuccess()
            } else {
                callback.onAddFoodFailed(reason: errorMessage)
            }
            
        }
    }
    
}

struct FoodDetails {
    var name: String?
    var description: String?
    var price: Double?
    var delivery_time: Int?
    var ingredients: [Ingredient]?
    var images: [PhotoItem]?
    var kitchen_images : [PhotoItem]?
    var receipt_images: [PhotoItem]?
}

class Ingredient : NSObject {
    var name: String = ""
    var date: String = ""
}

struct ExtraFood {
    var name: String
    var price: Int
}

struct PhotoItem {
    var title: String
    var image: UIImage
    var url: String
}
