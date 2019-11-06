//
//  LoginView.swift
//  Housefood
//
//  Created by Eric Hodgins on 2019/07/05.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit
import FirebaseAuth
import RxSwift

class UserLoginView: UIViewController {
    
    let viewModel = LoginViewModel()
    
    @IBOutlet weak var IDField: UITextField!
    @IBOutlet weak var passwordFIeld: UITextField!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginClick(_ sender: Any) {
        viewModel.signIn(with: IDField.text ?? "", password: passwordFIeld.text ?? "").subscribe(onCompleted: {
            (UIApplication.shared.delegate as! AppDelegate).loadUserUI(viewController: self)
        }) { (error) in
            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }.disposed(by: disposeBag)
    }
    
    @IBAction func signInWithApple(_ sender: Any) {
        
    }
    
    @IBAction func signInWithFB(_ sender: Any) {
        
    }
    
    @IBAction func signInWithGoogle(_ sender: Any) {
        
    }
    
    @IBAction func signInWithTwitter(_ sender: Any) {
        
    }
    
    @IBAction func goToUserHome(_ sender: Any) {
//        weak var pvc = self.presentingViewController
//        self.dismiss(animated: false) {
            (UIApplication.shared.delegate as! AppDelegate).loadUserUI(viewController: self)
//            pvc?.present(UIStoryboard(name: "User", bundle: nil).instantiateInitialViewController()!, animated: true, completion: nil)
//        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "userSignupWithPhone" {
            let view = segue.destination as! SignInWithPhoneView
            view.userType = .user
        }
    }
    
}
