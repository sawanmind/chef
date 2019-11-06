//
//  PlateRequest.swift
//  Housefood
//
//  Created by Oluha group on 8/20/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit
import RxSwift
import Alamofire

class PlateRequest: NSObject {
    static let shared = PlateRequest()

    func getPlates(page: Int) -> Single<[PlateResponse]> {
        return Single.create { (single) -> Disposable in
            Alamofire.request(EndPoint, method: HTTPMethod.get, encoding: URLEncoding.default, headers: nil).responseArray { (response: DataResponse<[PlateResponse]>) in
                if response.result.isSuccess {
                    single(.success(response.result.value!))
                } else {
                    single(.error(response.result.error!))
                }
            }
            return Disposables.create()
        }
    }

}
