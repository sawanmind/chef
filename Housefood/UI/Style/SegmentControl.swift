//
//  SegmentControl.swift
//  Housefood
//
//  Created by Sawan Kumar on 05/11/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

@IBDesignable
class SegmentControl: UIView {
    
    let segment: UISegmentedControl = {
        let control = UISegmentedControl()
        control.backgroundColor = .white
        control.tintColor = .red
        control.selectedSegmentTintColor = UIColor.white
        control.setBackgroundImage(UIImage(color: .white), for: .normal, barMetrics: .default)
        control.setDividerImage(UIImage(color: .white), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    private let bottomBar: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.layer.cornerRadius = 1
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let seperatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1).withAlphaComponent(0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    @IBInspectable
       var barTintColor: UIColor? {
           didSet {
                self.setTintColor(color: barTintColor)
           }
       }
    
    private func setTintColor(color:UIColor?){
        self.bottomBar.backgroundColor = color
        segment.setTitleTextAttributes([
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16) as Any,
            NSAttributedString.Key.foregroundColor: UIColor.black
        ], for: .normal)
        segment.setTitleTextAttributes([
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16) as Any,
            NSAttributedString.Key.foregroundColor: color as Any
        ], for: .selected)
    }
    
    @IBInspectable
    var segmentItems: [String] = ["Log in", "Sign up"] {
        didSet {
            guard segmentItems.count > 0 else { return }
            setupSegmentItems()
            bottomBarWidthAnchor?.isActive = false
            bottomBarWidthAnchor = bottomBar.widthAnchor.constraint(equalTo: segment.widthAnchor, multiplier: 1 / CGFloat(segmentItems.count))
            bottomBarWidthAnchor?.isActive = true
        }
    }
    
    var bottomBarWidthAnchor: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        addSubview(segment)
        
        segment.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        segment.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        segment.topAnchor.constraint(equalTo: topAnchor).isActive = true
        segment.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        segment.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        
     
        self.addSubview(seperatorLine)
        seperatorLine.addSubview(bottomBar)
        
        seperatorLine.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        seperatorLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        seperatorLine.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        seperatorLine.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        bottomBar.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bottomBar.heightAnchor.constraint(equalToConstant: 2).isActive = true
        bottomBar.leftAnchor.constraint(equalTo: segment.leftAnchor).isActive = true
        bottomBarWidthAnchor = bottomBar.widthAnchor.constraint(equalTo: segment.widthAnchor, multiplier: 1 / CGFloat(segmentItems.count))
        bottomBarWidthAnchor?.isActive = true
        
        
        setupSegmentItems()
    }
    
    private func setupSegmentItems() {
        for (index, value) in segmentItems.enumerated() {
            segment.insertSegment(withTitle: value, at: index, animated: true)
        }
        segment.selectedSegmentIndex = 0
    }
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
      
        UIView.animate(withDuration: 0.3) {
            let originX = (self.segment.frame.width / CGFloat(self.segmentItems.count)) * CGFloat(self.segment.selectedSegmentIndex)
            self.bottomBar.frame.origin.x = originX
        }
    }
}
