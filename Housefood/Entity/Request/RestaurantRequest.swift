//
//  RestaurantRequest.swift
//  Housefood
//
//  Created by Eric Hodgins on 2019/07/13.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit
import RxSwift
import Alamofire
import AlamofireObjectMapper

class RestaurantRequest: NSObject {

    static let shared = RestaurantRequest()
    
    func getRestaurants() -> Single<[RestaurantResponse]> {
        return Single.create { (single) -> Disposable in
            Alamofire.request(EndPoints.herokuapp.compose(.allRestaurants), method: HTTPMethod.get, encoding: URLEncoding.default, headers: nil).responseArray { (response: DataResponse<[RestaurantResponse]>) in
                if response.result.isSuccess {
                    single(.success(response.result.value!))
                }
            }
            return Disposables.create()
        }
    }
    
    func getRestaurant(resId: String) -> Single<[RestaurantResponse]> {
        return Single.create { (single) -> Disposable in
            Alamofire.request(EndPoints.herokuapp.compose(API.getRestaurantWithID.compose(resId)), method: HTTPMethod.get, encoding: URLEncoding.default, headers: nil)
            return Disposables.create()
        }
    }
    
    func addRestaurant(name: String, address: String, phone: Int, status: Int) -> Single<Result<String>>{
        return Single.create { (single) -> Disposable in
            Alamofire.request(EndPoints.herokuapp.compose(.addRestaurant), method: HTTPMethod.post, parameters: ["name": name, "address": address, "phone": phone, "status": status], encoding: URLEncoding.default, headers: nil).responseString { (response) in
                if response.result.isSuccess {
                    single(.success(response.result))
                } else {
                    single(.error(response.result.error!))
                }
            }
            return Disposables.create()
        }
    }
    
    func updateRestaurant(resId: String, name: String, address: String, phone: Int, status: Int) -> Single<Result<String>> {
        return Single.create { (single) -> Disposable in
            Alamofire.request(EndPoints.herokuapp.compose(API.actionToARestaurant.compose(resId)), method: HTTPMethod.patch, parameters: ["name": name, "address": address, "phone": phone, "status": status], encoding: URLEncoding.default, headers: nil).responseString { (response) in
                if response.result.isSuccess {
                    single(.success(response.result))
                } else {
                    single(.error(response.result.error!))
                }
            }
            return Disposables.create()
        }
    }
    
    func deleteRestaurant(resId: String) -> Single<Result<String>> {
        return Single.create { (single) -> Disposable in
            Alamofire.request(EndPoints.herokuapp.compose(API.actionToARestaurant.compose(resId)), method: HTTPMethod.delete, encoding: URLEncoding.default, headers: nil).responseString { (response) in
                if response.result.isSuccess {
                    single(.success(response.result))
                } else {
                    single(.error(response.result.error!))
                }
            }
            return Disposables.create()
        }
    }
}
