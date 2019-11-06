//
//  RoundedView.swift
//  Housefood
//
//  Created by Oluha group on 7/29/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

class RoundedView: UIView {

    @IBInspectable var cornerRadius : CGFloat = 0.0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var shadowOpacity : CGFloat = 0.1 {
        didSet{
            self.layer.shadowOpacity = Float(shadowOpacity)
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat = 8.0 {
        didSet {
            self.layer.shadowRadius = borderWidth
        }
    }
    
    @IBInspectable
    var isDividerVisible: Bool = false {
        didSet {
            if isDividerVisible {
                let testFrame = CGRect(x: self.bounds.width/2, y: 0, width: borderWidth, height: self.bounds.height)
                let testView = UIView(frame: testFrame)
                testView.backgroundColor = borderColor
                self.addSubview(testView)
            }
        }
    }

    
    @IBInspectable
    var borderColor: UIColor? {
        didSet {
            self.layer.borderWidth = 0.2
            self.layer.borderColor = borderColor?.cgColor
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        self.layer.cornerRadius = 8
        
        //MARK:- Shade a view
        self.layer.shadowOffset = CGSize(width: 0 , height:6)
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.masksToBounds = false
        
        super.layoutSubviews()
    }
}
