//
//  CustomUILabel.swift
//  Housefood
//
//  Created by Oluha group on 8/17/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

class CustomUILabel: UILabel {
        
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 4
        
        super.drawText(in: rect.inset(by: insets))
    }
    
}
