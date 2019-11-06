//
//  LoginResponse.swift
//  Housefood
//
//  Created by Eric Hodgins on 2019/07/17.
//  Copyright © 2019 Oluha. All rights reserved.
//

import Foundation
import ObjectMapper

struct UserResponse: Mappable {
    
    var full_name: String!
    var email_address: String!
    var phone: Int!
    var auth_token: String!
    var status: Int!
    var user_type: String!
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        full_name <- map["full_name"]
        email_address <- map["email_address"]
        phone <- map["phone_no"]
        auth_token <- map["authtoken"]
        status <- map["status"]
        user_type <- map["user_type"]
    }
}


// MARK: - SignUp response
struct LoginResponse: Codable ,Equatable {
    let token: String?
    let result: LoginResponseData?
    let status: Int?
}

// MARK: - LoginResponseData
struct LoginResponseData:Codable,Equatable {
    let id: Int?
    let name: String?
    let email: String?
    let country_code: Int?
    let phone_no: Int?
    let user_type: String?
    let verification_email_status: String?
    let verification_phone_status: String?
    let createdAt: String?
}

