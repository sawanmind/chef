//
//  SplashView.swift
//  Housefood
//
//  Created by Eric Hodgins on 2019/07/14.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    fileprivate let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1.5) {
            if UserDefaults.standard.object(forKey: UserData.user_type.rawValue) != nil {
                switch UserDefaults.standard.object(forKey: UserData.user_type.rawValue) as! UserType {
                case .user:
                    self.appDelegate.loadUserUI(viewController: self)
                    break
                case .chef:
                    self.appDelegate.loadChefUI(viewController: self)
                    break
                }
            } else {
                self.appDelegate.loadLoginUI(viewController: self)

//                self.appDelegate.loadChefUI(viewController: self)
            }
        }
    }
    
}
