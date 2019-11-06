//
//  ThumbnailStyle.swift
//  Housefood
//
//  Created by Eric Hodgins on 2019/07/16.
//  Copyright © 2019 Oluha. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class ThumbnailStyle: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 10
    }
}
