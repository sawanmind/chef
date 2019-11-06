//
//  APIManager.swift
//  Housefood
//
//  Created by Oluha group on 8/20/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit
import Alamofire

class APIManager: NSObject {
    
    static let shared = APIManager()

    func getPlateList(page:Int, delegate: @escaping ([Plate], Bool, String) -> ()) {
        
        Alamofire.request(EndPoint2+API.plate.rawValue+"?pageSize=10&page=\(page)", method: HTTPMethod.get, encoding: URLEncoding.default, headers: nil).responseJSON { response in
            
            if response.response?.statusCode == 202 {
                if let plates = try? response.deserialize([Plate].self) {
                    delegate(plates, true, "")
                } else {
                    delegate([], false, "Deserialize failed")
                }
            } else {
                delegate([], false, "Response error")
            }
        }
        
    }
    
    func postaFood(plate: FoodDetails, callback: @escaping (Bool, String) -> ()) {
        
        let params : Parameters = [
            "name"              : plate.name ?? "",
            "description"       : plate.description ?? "",
            "price"             : plate.price ?? "",
            "delivery_time"     : plate.delivery_time ?? 0,
            "ingredients"       : getIngredientArray(ingredientArray: plate.ingredients ?? []),
            "images"            : getImageDictArray(imageArray: plate.images ?? []),
            "kitchen_images"    : getImageDictArray(imageArray: plate.kitchen_images ?? []),
            "receipt_images"    : getImageDictArray(imageArray: plate.receipt_images ?? [])
        ]

        Alamofire.request(EndPoint2+API.plate.rawValue, method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON{ response in
            
            if response.response?.statusCode == 201 {
                callback(true, "")
            } else {
                callback(false, "Error")
            }
        }

    }
    
    func editaFood(plate: FoodDetails, foodItemId:Int, callback: @escaping (Bool, String) -> ()) {
        
        let params : Parameters = [
            "name"              : plate.name ?? "",
            "description"       : plate.description ?? "",
            "price"             : plate.price ?? "",
            "delivery_time"     : plate.delivery_time ?? 0,
            "sell_count"        : "",
            "Ingredients"       : [],
            "PlateImages"       : [],
            "ReceiptImages"     : [],
        ]
        
        Alamofire.request(EndPoint2+API.plate.rawValue+"edit/\(foodItemId)", method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON{ response in
            
            if response.response?.statusCode == 204 {
                callback(true, "")
            } else {
                callback(false, "Error")
            }
        }
        
    }

    fileprivate func getImageDictArray(imageArray: [PhotoItem]) -> [NSDictionary] {
        var imageDictArray = [NSDictionary]()
        for image in imageArray {
            let image : NSDictionary = [
                "name" : image.title,
                "url" : image.url
            ]
            imageDictArray.append(image)
        }
        return imageDictArray
    }
    
    fileprivate func getIngredientArray(ingredientArray: [Ingredient]) -> [NSDictionary] {
        var ingredientsArray = [NSDictionary]()
        for ingredient in ingredientArray {
            let ingred : NSDictionary = [
                "name" : ingredient.name,
                "purchase_date" : ingredient.date
            ]
            ingredientsArray.append(ingred)
        }
        return ingredientsArray
    }

}
