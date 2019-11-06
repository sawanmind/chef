//
//  API.swift
//  Housefood
//
//  Created by Eric Hodgins on 2019/07/07.
//  Copyright © 2019 Oluha. All rights reserved.
//

import Foundation

//let EndPoint = "https://housefood.com/api/v1"
let EndPoint = "https://mycheffy.herokuapp.com"
//let EndPoint2 = "https://api.thecheffy.com"
let EndPoint2 = "https://mycheffy.herokuapp.com"
let access_token = "Bearer " + UserDefaults.standard.string(forKey: "access_token")!
let header = ["Authorization":access_token]

enum EndPoints: String {
    case herokuapp = "https://mycheffy.herokuapp.com"
    case thecheffy = "https://api.thecheffy.com"
    case housefoodV1 = "https://housefood.com/api/v1"
    
    func compose(_ package: String) -> String {
        return rawValue + package
    }
    
    func compose(_ package: API) -> String {
        return rawValue + package.rawValue
    }
}

enum API: String {
    case allRestaurants = "/restaurants"
    case getRestaurantWithID = "/restaurants/"
    case addRestaurant = "/restaurant"
    case actionToARestaurant = "/restaurant/"
    case signUp = "/user"
    case signIn = "/user/login"
    case socialSignUp = "/socialsignup"
    case getUserWithID = "/user/"
    case searchFoodOrRestaurant = "/search"
    case examplePost = "/endpointpost"
    case exampleGetUser = "/endpointget/"
    case plate = "/plate"
    case orderList = "/order/list"
    case listOrdersBeingDelivered = "/tracking"
    case orderPayment = "/order"
    
    
    func compose(_ package: API) -> String {
        return rawValue + package.rawValue
    }
    
    func compose(_ package: String) -> String {
        return rawValue + package
    }
    
}
