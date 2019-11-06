//
//  roundButton.swift
//  Housefood
//
//  Created by Oluha group on 2019/07/05.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
    
    @IBInspectable
    var titleText: String? {
        didSet {
            self.setTitle(titleText, for: UIControl.State.normal)
        }
    }
    
    @IBInspectable
    var titleColor: UIColor? {
        didSet {
            self.setTitleColor(titleColor, for: .normal)
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        didSet {
            self.layer.borderColor = borderColor?.cgColor
            self.layer.borderWidth = 0.8
        }
    }
    
    @IBInspectable var cornerRadius : CGFloat = 0.0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable
    var dropShadow: UIColor? {
        didSet {
            self.layer.shadowColor = dropShadow?.cgColor
            self.layer.shadowOffset = CGSize(width: 3, height: 3)
            self.layer.shadowOpacity = 0.2
            self.layer.shadowRadius = 8
            self.layer.masksToBounds = false
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
    }
}
