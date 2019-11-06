//
//  UIButton.swift
//  Housefood
//
//  Created by Sawan Kumar on 06/11/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import Foundation
import UIKit


public extension UIButton {
    
    private struct AssociatedKeys {
        static var kUIActivityIndicatorView = "UIActivityIndicatorView"
    }
    
    private var activityIndicator: UIActivityIndicatorView? {
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.kUIActivityIndicatorView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.kUIActivityIndicatorView) as? UIActivityIndicatorView
        }
    }
    
     func showLoading() {
        if let text = self.titleLabel?.text {
            UserDefaults.standard.set(text, forKey: "save_title")
        }
        self.setTitle("", for: UIControl.State.normal)
        self.isUserInteractionEnabled = false
        if (activityIndicator == nil) {
            activityIndicator = createActivityIndicator()
        }
        
        showSpinning()
    }
    
     func hideLoading() {
        
        if let save_title = UserDefaults.standard.object(forKey: "save_title") as? String {
            self.setTitle(save_title, for: UIControl.State.normal)
        }
        
        self.isUserInteractionEnabled = true
        activityIndicator?.stopAnimating()
        UserDefaults.standard.removeObject(forKey: "save_title")
    }
    
    private func createActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = UIColor.white
        return activityIndicator
    }
    
    private func showSpinning() {
        activityIndicator?.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(activityIndicator!)
        centerActivityIndicatorInButton()
        activityIndicator?.startAnimating()
    }
    
    private func centerActivityIndicatorInButton() {
        let xCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: activityIndicator, attribute: .centerX, multiplier: 1, constant: 0)
        self.addConstraint(xCenterConstraint)
        
        let yCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: activityIndicator, attribute: .centerY, multiplier: 1, constant: 0)
        self.addConstraint(yCenterConstraint)
    }
    
    
      func addShadow(){
        self.layer.shadowColor = UIColor(red: 234/255, green: 29/255, blue: 44/255, alpha: 1).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 5
        self.layer.masksToBounds = false
      }
      
}
