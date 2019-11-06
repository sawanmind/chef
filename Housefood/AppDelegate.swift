//
//  AppDelegate.swift
//  Housefood
//
//  Created by Eric Hodgins on 2019/07/05.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit
import Firebase
//import AppCenter
//import AppCenterAnalytics
//import AppCenterCrashes
//import AppCenterDistribute

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        MSDistribute.setEnabled(true)
//        MSAppCenter.start("49261a5c-2c45-4eee-ad85-480506faf596", withServices:[
//          MSAnalytics.self,
//          MSCrashes.self,
//          MSDistribute.self
//        ])
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIStoryboard(name: "Splash", bundle: nil).instantiateInitialViewController()
        window?.makeKeyAndVisible()
        
        UIBarButtonItem.appearance().tintColor = UIColor.black
        
        return true
    }
    
//    func application(_ application: UIApplication,
//                     configurationForConnecting connectingSceneSession: UISceneSession,
//                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//
//        //return UISceneConfiguration(name: "Chef", sessionRole: connectingSceneSession.role)
//    }
    
    func loadUserUI(viewController: UIViewController) {
        viewController.present(UIStoryboard(name: "User", bundle: nil).instantiateInitialViewController()!, animated: true, completion: nil)
    }
    
    func loadChefUI(viewController: UIViewController) {
        viewController.navigationController?.pushViewController(UIStoryboard(name: "Chef", bundle: nil).instantiateInitialViewController()!, animated: true)
    }
    
    func loadLoginUI(viewController: UIViewController) {
        let vc = ChefLoginView.getChefLoginView()
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}
