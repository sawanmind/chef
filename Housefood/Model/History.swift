//
//  History.swift
//  Housefood
//
//  Created by Eric Hodgins on 2019/07/05.
//  Copyright © 2019 Oluha. All rights reserved.
//

import Foundation
import UIKit
import RxDataSources

struct History {
    let name: String
    let detail: String
    let thumbnail_url: String
    var status: String
}

extension History: Equatable, IdentifiableType {
    typealias Identity = String
    
    var identity: Identity {
        return self.name
    }
    
    static func == (lhs: History, rhs: History) -> Bool {
        return lhs.name == rhs.name
    }
}

struct SectionOfHistory {
    var header: String
    var items: [Item]
}

extension SectionOfHistory: AnimatableSectionModelType {
    typealias Item = History
    
    var identity: String {
        return header
    }
    
    init(original: SectionOfHistory, items: [SectionOfHistory.Item]) {
        self = original
        self.items = items
    }
}
