//
//  MapDetailsViewController.swift
//  Housefood
//
//  Created by Oluha group on 8/21/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

class MapDetailsViewController: UIViewController, UIGestureRecognizerDelegate {

    var main: UIViewController!
    var swipeView: UIView!
    var upperBoundFrom: CGPoint!
    var upperBoundTo: CGPoint!
    var lowerBoundFrom: CGPoint!
    var lowerBoundTo: CGPoint!
    
    var animater: UIDynamicAnimator?
    var container: UICollisionBehavior?
    var snap: UISnapBehavior?
    var dynamicItem: UIDynamicItemBehavior?
    var gravity: UIGravityBehavior?
    var isTop = false
    
    func configureSwipeView(_ isupper: Bool = false) {
        
        isTop = isupper
        
        let gesture = UIPanGestureRecognizer(target: main, action: #selector(handlePan))
        swipeView.addGestureRecognizer(gesture)
        
        gesture.delegate = self
        
        animater = UIDynamicAnimator(referenceView: main.view)
        
        dynamicItem = UIDynamicItemBehavior(items: [swipeView])
        dynamicItem?.allowsRotation = false
        dynamicItem?.elasticity = 0
        
        gravity = UIGravityBehavior(items: [swipeView])
        gravity?.gravityDirection = CGVector(dx: 0, dy: isupper ? -1 : 1)
        
        container = UICollisionBehavior(items: [swipeView])
        configureContainer()
        
        animater?.addBehavior(gravity!)
        animater?.addBehavior(dynamicItem!)
        animater?.addBehavior(container!)
        
    }
    
    @objc func handlePan(_ sender: UIPanGestureRecognizer) {
        let velocity = sender.velocity(in: main.view).y
        
        var movement = swipeView.frame
        movement.origin.x = 0
        movement.origin.y = movement.origin.y + (velocity * 0.05)
        
        if sender.state == .ended {
            panGestureEnded()
        } else if sender.state == .began {
            snapToBottom()
        } else {
            if snap != nil { animater?.removeBehavior(snap!) }
            snap = UISnapBehavior(item: swipeView, snapTo: CGPoint(x: movement.midX, y: movement.midY))
            animater?.addBehavior(snap!)
        }
    }
    
    func configureContainer() {
        container?.addBoundary(withIdentifier: "upper" as NSCopying, from: upperBoundFrom, to: upperBoundTo)
        container?.addBoundary(withIdentifier: "lower" as NSCopying, from: lowerBoundFrom, to: lowerBoundTo)
    }
    
    //This method helped me stopped up/down pangesture of UITableviewCell and allow only vertical scroll
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if let panGestureRecognizer = gestureRecognizer as? UIPanGestureRecognizer {
            let translation = panGestureRecognizer.translation(in: swipeView)
            if abs(translation.x) > abs(translation.y) {
                return false
            }
        }
        return true
    }
    
    func panGestureEnded() {
        if snap != nil { animater?.removeBehavior(snap!) }
        
        let velocity = dynamicItem!.linearVelocity(for: swipeView)
        
        if fabsf(Float(velocity.y)) > 250 {
            if velocity.y > 0 {
                snapToBottom()
            } else {
                snapToTop()
            }
        } else {
            if swipeView.frame.origin.y <= main.view.bounds.size.height / 2 {
                snapToTop()
            } else {
                snapToBottom()
            }
        }
    }
    
    func snapToBottom() {
        isTop = false
        main.view.endEditing(true)
        gravity?.gravityDirection = CGVector(dx: 0, dy: 2.5)
    }
    
    func snapToTop() {
        isTop = true
        gravity?.gravityDirection = CGVector(dx: 0, dy: -2.5)
    }

}
