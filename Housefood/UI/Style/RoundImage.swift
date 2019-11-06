//
//  RoundImage.swift
//  Housefood
//
//  Created by Oluha group on 7/28/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

class RoundImage: UIImageView {
    
    @IBInspectable var cornerRadius : CGFloat = 5.0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = true
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
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }

}
