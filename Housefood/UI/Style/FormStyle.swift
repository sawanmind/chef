//
//  FormStyle.swift
//  Housefood
//
//  Created by Eric Hodgins on 2019/07/12.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

@IBDesignable
class FormStyle: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 10
    }
}
