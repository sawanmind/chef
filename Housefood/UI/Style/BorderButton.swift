//
//  BorderButton.swift
//  Housefood
//
//  Created by Eric Hodgins on 2019/07/10.
//  Copyright © 2019 Oluha. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class BorderButton: UIButton {
    
    @IBInspectable
    var titleText: String? {
        didSet {
            self.setTitle(titleText, for: UIControl.State.normal)
            self.setTitleColor(UIColor.black, for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 25
        self.layer.borderColor = UIColor.black.cgColor
    }
}
