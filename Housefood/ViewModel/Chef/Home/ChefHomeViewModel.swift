//
//  ChefHomeViewModel.swift
//  Housefood
//
//  Created by Oluha group on 8/20/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

protocol UIGetPlatesDelegate {
    func onGetPlatesSuccess(items: [Plate])
    func onGetPlatesFailed(reason: String)
}

protocol UIGetOrderRequestDelegate {
    func onGetOrderRequestSuccess(items: [OrderResponse])
    func onGetOrderRequestFailed(reason: String)
}

class ChefHomeViewModel {

    func getPlates(callback: UIGetPlatesDelegate) {
        APIManager.shared.getPlateList(page: 1) { (plates, isSuccess, errorMessage) in
            if isSuccess {
                callback.onGetPlatesSuccess(items: plates)
            } else {
                callback.onGetPlatesFailed(reason: errorMessage)
            }
        }
        
    }
    
    func getOrderRequests(callback: UIGetOrderRequestDelegate) {
        OrdersRequest.getOrderRequests { (orderRequests, isSuccess, errorMessage) in
            if isSuccess {
                callback.onGetOrderRequestSuccess(items: orderRequests)
            } else {
                callback.onGetOrderRequestFailed(reason: errorMessage)
            }
        }
    }

}
