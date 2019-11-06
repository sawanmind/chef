//
//  OrdersResponse.swift
//  Housefood
//
//  Created by Oluha group on 23/10/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import Foundation
import ObjectMapper

struct OrderPaymentResponse: Mappable {
    var message: String?
    var error: Bool?
    
    init?(map: Map) {}
      
    mutating func mapping(map: Map) {
        message <- map["message"]
        error <- map["error"]
    }
}

struct OrdersBeingDeliveredResponse: Mappable {
    
    var message: String?
    var data: [OrdersBeingDeliveredData]?
    
    init?(map: Map) {}
    mutating func mapping(map: Map) {
         message <- map["message"]
         data <- map["Data"]
    }
}

struct OrdersBeingDeliveredData: Mappable {
    var id, datumBasketID, datumUserID, shippingID: Int?
    var stateType: String?
    var totalItens: Int?
    var shippingFee: String?
    var orderTotal: Int?
    var createdAt, updatedAt: String?
    var basketID, userID: Int?
    var orderPayments: [OrderPaymentData]?
    var orderItems: [OrderItem]?
    var orderDeliveries: [OrderDelivery]?
    
    
    init?(map: Map) {}
    mutating func mapping(map: Map) {
        id <- map["id"]
        datumBasketID <- map["basketId"]
        datumUserID <- map["userId"]
        shippingID <- map["shippingId"]
        stateType <- map["state_type"]
        totalItens <- map["total_itens"]
        shippingFee <- map["shipping_fee"]
        orderTotal <- map["order_total"]
        createdAt <- map["updatedAt"]
        updatedAt <- map["updatedAt"]
        basketID <- map["BasketId"]
        userID <- map["UserId"]
        orderPayments <- map["OrderPayments"]
        orderItems <- map["OrderItems"]
        orderDeliveries <- map["OrderDeliveries"]
    }
}

struct OrderDelivery: Mappable {
    var id: Int?
    init?(map: Map) {}
    mutating func mapping(map: Map) {
         id <- map["id"]
    }
}

struct OrderItem: Mappable {
    var plateID: Int?
    var chefLocation, name, orderItemDescription: String?
    var amount, quantity: Int?
    var plate: PlateOrdered?
    
    init?(map: Map) {}
    mutating func mapping(map: Map) {
        plateID <- map["plate_id"]
        chefLocation <- map["chef_location"]
        name <- map["name"]
        orderItemDescription <- map["description"]
        amount <- map["amount"]
        quantity <- map["quantity"]
        plate <- map["plate"]
    }
}

struct PlateOrdered: Mappable {
    var id: Int?
    var name, plateDescription: String?
    var price, deliveryTime, sellCount: Int?
    var deliveryType: String?
    var plateUserID, categoryID, rating: Int?
    var createdAt, updatedAt: String?
    var userID: Int?
    var chef: Chef?
    var plateImages: [PlateImage]?

    init?(map: Map) {}
    mutating func mapping(map: Map) {
         id <- map["id"]
         name <- map["name"]
         plateDescription <- map["description"]
         price <- map["price"]
         deliveryTime <- map["delivery_time"]
         sellCount <- map["sell_count"]
         deliveryType <- map["delivery_type"]
         plateUserID <- map["userId"]
         categoryID <- map["categoryId"]
         rating <- map["rating"]
         createdAt <- map["createdAt"]
         updatedAt <- map["updatedAt "]
         userID <- map["UserId"]
         chef <- map["chef"]
         plateImages <- map["PlateImages"]
    }
}

struct Chef: Mappable {
    var id: Int?
    var name, email, countryCode: String?
    var phoneNo, authToken: String?
    var restaurantName, password, location, userType: String?
    var imagePath, verificationCode: String?
    var verificationEmailToken, verificationEmailStatus: String?
    var verificationPhoneToken: String?
    var verificationPhoneStatus: String?
    var status, userIP: String?
    var createdAt, updatedAt: String?
    
    init?(map: Map) {}
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        email <- map["email"]
        countryCode <- map["country_code"]
        phoneNo <- map["phone_no"]
        authToken <- map["auth_token"]
        restaurantName <- map["restaurant_name"]
        password <- map["password"]
        location <- map["location"]
        userType <- map["user_type"]
        imagePath <- map["imagePath"]
        verificationCode <- map["verification_code"]
        verificationEmailToken <- map["verification_email_token"]
        verificationEmailStatus <- map["verification_email_status"]
        verificationPhoneToken <- map["verification_phone_token"]
        verificationPhoneStatus <- map["verification_phone_status"]
        status <- map["status"]
        userIP <- map["user_ip"]
        createdAt <- map["createdAt"]
        updatedAt <- map["updatedAt"]
    }
}

struct PlateOrderedImage: Mappable {
    var id: Int?
    var name: String?
    var url: String?
    var plateImagePlateID: Int?
    var createdAt, updatedAt: String?
    var plateID: Int?
    
    init?(map: Map) {}
    mutating func mapping(map: Map) {
         id <- map["id"]
         name <- map["name"]
         url <- map["url"]
         plateImagePlateID <- map["plateId"]
         createdAt <- map["createdAt"]
         updatedAt <- map["updatedAt"]
         plateID <- map["PlateId"]
    }
}

struct OrderPaymentData: Mappable {
    var paymentID: String?
    var amount: Int?
    var clientSecret, customer, paymentMethod, status: String?

    init?(map: Map) {}
    mutating func mapping(map: Map) {
         paymentID <- map["payment_id"]
         amount <- map["amount"]
         clientSecret <- map["client_secret"]
         customer <- map["customer"]
         paymentMethod <- map["payment_method"]
         status <- map["customer"]
    }
}
