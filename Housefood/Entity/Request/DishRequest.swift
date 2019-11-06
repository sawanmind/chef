//
//  DishRequest.swift
//  Housefood
//
//  Created by Eric Hodgins on 2019/07/07.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit
import RxSwift
import Alamofire

class DishRequest: NSObject {

    static let shared = DishRequest()
    
    func getDishes(page: Int) -> Single<[DishResponse]> {
        return Single.create { (single) -> Disposable in
            Alamofire.request(EndPoint, method: HTTPMethod.get, encoding: URLEncoding.default, headers: nil).responseArray { (response: DataResponse<[DishResponse]>) in
                if response.result.isSuccess {
                    single(.success(response.result.value!))
                } else {
                    single(.error(response.result.error!))
                }
            }
            return Disposables.create()
        }
    }
    
    func search(word: String) -> Single<DataResponse<[DishResponse]>> {
        return Single.create { (single) -> Disposable in
            Alamofire.request(EndPoints.herokuapp.compose(.searchFoodOrRestaurant), method: HTTPMethod.get, parameters: ["word": word], encoding: URLEncoding.default, headers: header).responseArray { (response: DataResponse<[DishResponse]>) in
                if response.result.isSuccess {
                    single(.success(response))
                } else {
                    single(.error(response.result.error!))
                }
            }
            return Disposables.create()
        }
    }
}
