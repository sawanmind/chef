//
//  SigninRequest.swift
//  Housefood
//
//  Created by Eric Hodgins on 2019/07/17.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit
import RxSwift
import Alamofire

class LoginRequest: NSObject {

    static let shared = LoginRequest()
    
    
    
    func signIn(email: String, password: String) -> Single<LoginResponse?> {
        return Single.create { (single) -> Disposable in
            Alamofire.request(EndPoint+API.signIn.rawValue, method: HTTPMethod.post,
                              parameters: ["email_address": email, "password": password],
                              encoding: URLEncoding.default, headers: nil)
                .responseJSON(completionHandler: { (response: DataResponse<Any>) in
                 if response.result.isSuccess , let data = response.data {
                      let data = try? JSONDecoder().decode(LoginResponse.self, from: data)
                                                      single(.success(data))
                 } else {
                    single(.error(response.result.error!))
                }
            })
        
            return Disposables.create()
        }
    }
    
    func signUp(email: String, password: String , userType:UserType) -> Single<LoginResponse?> {
           return Single.create { (single) -> Disposable in
            var parameters:[String:Any] = [:]
            
            if userType == .chef {
                parameters = ["email": email, "password": password, "user_type":userType.rawValue, "restaurant_name":"Example Restaurant's"]
            }else {
                parameters = ["email": email, "user_type":userType.rawValue]
            }
            
            
            Alamofire.request(EndPoint+API.signUp.rawValue, method: HTTPMethod.post,
                              parameters: parameters,
                              encoding: URLEncoding.default, headers: nil)
                .responseJSON(completionHandler: { (response: DataResponse<Any>) in
                    if response.result.isSuccess, let data = response.data {
                                    let data = try? JSONDecoder().decode(LoginResponse.self, from: data)
                                    single(.success(data))
                                } else {
                                    single(.error(response.result.error!))
                                }
                              })
            
               return Disposables.create()
           }
       }
}
