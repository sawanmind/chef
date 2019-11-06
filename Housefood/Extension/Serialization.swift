//
//  Serialization.swift
//  Housefood
//
//  Created by Oluha group on 23/10/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import Foundation

extension Encodable {
  var dictionary: [String: Any]? {
    guard let data = try? JSONEncoder().encode(self) else { return nil }
    return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
  }
}
