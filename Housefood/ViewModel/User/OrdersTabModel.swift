//
//  OrdersTabModel.swift
//  Housefood
//
//  Created by Eric Hodgins on 2019/07/06.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class OrdersTabModel: NSObject {

    var history = [History]()
    
    let historyProvider = BehaviorRelay(value: [SectionOfHistory]())
    
    override init() {
        super.init()
        getHistory()
    }
    
    func getHistory() {
        
    }
}
