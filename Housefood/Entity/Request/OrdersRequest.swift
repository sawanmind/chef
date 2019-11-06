//
//  OrdersRequest.swift
//  Housefood
//
//  Created by Oluha group on 22/10/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import Foundation
import Alamofire

//Is no a good practice use singletons classes because they live during all aplication life,
//use statics data like structs is a lot of better -> https://learnappmaking.com/struct-vs-class-swift-how-to/
struct OrdersRequest {
    
    static func orderPayment(orderPayment: OrderPayment, onCompletion: @escaping (Result<OrderPaymentResponse>)->()) {
        Alamofire.request(EndPoints.herokuapp.compose(.orderPayment),
                          method: HTTPMethod.post,
                          parameters: orderPayment.dictionary,
                          encoding: URLEncoding.default,
                          headers: nil).responseObject { (response:DataResponse<OrderPaymentResponse>) in
                            onCompletion(response.result)
                            
        }
    }
    
    static func getListOrdersBeingDelivered(onCompletion: @escaping (Result<OrdersBeingDeliveredResponse>)->()) {
        Alamofire.request(EndPoints.herokuapp.compose(API.orderList.compose(.listOrdersBeingDelivered)),
                          method: HTTPMethod.post,
                          encoding: URLEncoding.default,
                          headers: nil).responseObject { (response:DataResponse<OrdersBeingDeliveredResponse>) in
                            onCompletion(response.result)
        }
    }
    
    static func getOrderRequests(delegate: @escaping ([OrderResponse], Bool, String) -> ()) {
        Alamofire.request(EndPoints.herokuapp.compose(.orderList),
                          method: HTTPMethod.get,
                          encoding: URLEncoding.default,
                          headers: nil).responseJSON { response in
                            
                            if response.response?.statusCode == 202 {
                                if let orderRequests = try? response.deserialize([OrderResponse].self) {
                                    delegate(orderRequests, true, "")
                                } else {
                                    delegate([], false, "Deserialize failed")
                                }
                            } else {
                                delegate([], false, "Response error")
                            }
        }
    }
}
