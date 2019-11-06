//
//  TextInput.swift
//  Housefood
//
//  Created by Eric Hodgins on 2019/07/10.
//  Copyright © 2019 Oluha. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class TextInput: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
    }
}

class LeftPaddingSpaceTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
