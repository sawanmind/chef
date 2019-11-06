//
//  ChefButton.swift
//  Housefood
//
//  Created by Oluha group on 7/28/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

class ChefButton: UIButton {

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
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable
    var glowColor: UIColor? {
        didSet {
            self.layer.shadowColor = glowColor?.cgColor
            self.layer.shadowRadius = 6.0
            self.layer.shadowOpacity = 0.4
            self.layer.shadowOffset = CGSize(width: 0 , height:6)
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
