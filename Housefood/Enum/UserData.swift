//
//  UserData.swift
//  Housefood
//
//  Created by Eric Hodgins on 2019/07/11.
//  Copyright © 2019 Oluha. All rights reserved.
//

import Foundation

enum UserData: String {
    case user_type = "user_type"
    case verificationID = "authVerificationID"
    case userUID = "user_uid"
    case name = "user_name"
    case profile_image_url = "user_profile_image_url"
    case email = "user_email"
    case profile = "user_profile"
    case phone = "user_phone_number"
    case address = "user_address"
}

enum UserType:String {
    case user
    case chef
}
