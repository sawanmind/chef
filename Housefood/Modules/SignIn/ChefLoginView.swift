//
//  ChefLoginView.swift
//  Housefood
//
//  Created by Eric Hodgins on 2019/07/14.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit
import FirebaseAuth
import RxSwift
import RxCocoa

class ChefLoginView: UIViewController, UITextFieldDelegate {

    // MARK: Properties
    @IBOutlet weak var emailAddressTextField:UITextField!
    @IBOutlet weak var passwordTextField:UITextField!
    @IBOutlet weak var segmentControl:SegmentControl!
    @IBOutlet weak var submitButton:RoundButton!
    @IBOutlet weak var passwordShowHideButton:UIButton!
    @IBOutlet weak var password_errorLabel:UILabel!
    
    private let disposeBag = DisposeBag()
    private let emailValidator = EmailValidator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeEmail()
        observeSegmentControl()
        setupUI()
    }
    
    class func getChefLoginView()->ChefLoginView{
        let vc = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "ChefLoginView") as! ChefLoginView
        return vc
    }
    
    // MARK: Observe Segment Change
    private func observeSegmentControl(){
        self.segmentControl.segment.rx.selectedSegmentIndex
            .subscribe { (index) in
            if index.element == 0 {
                self.submitButton.setTitle("Log in", for: .normal)
            }else {
                self.submitButton.setTitle("Sign up", for: .normal)
            }
        }
         .disposed(by: self.disposeBag)
    }
    
    // MARK: Observe Email
    private func observeEmail(){
        emailAddressTextField.rx.text
            .orEmpty
            .map(emailValidator.validate)
            .subscribe(onNext: { isValid in
                if !isValid {
                    self.emailAddressTextField.textColor = UIColor.red
                }else {
                    self.emailAddressTextField.textColor = UIColor.black
                }
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: Handle SignIn / SignUp
    @IBAction func signInWithEmail(_ sender: RoundButton) {
        if self.segmentControl.segment.selectedSegmentIndex == 0 {
            self.handleSignIn(sender)
        }else {
            self.handleSignUp(userType: .chef,sender)
        }
    }
    
    // MARK: Handle SignIn
    private func handleSignIn(_ sender: RoundButton){
        guard let email = self.emailAddressTextField.text, email != "",
            emailValidator.validate(email) else {return}
        guard let password = self.passwordTextField.text, password != "" else {return}
        sender.showLoading()
        LoginRequest.shared.signIn(email: email, password: password).subscribe(onSuccess: { (result) in
            sender.hideLoading()
            if result?.status == 200 || result?.status == 201 {
                (UIApplication.shared.delegate as! AppDelegate).loadChefUI(viewController: self)
            }
            debugPrint("result:",result as Any)
        }) { (error) in
            sender.hideLoading()
            debugPrint("error:",error.localizedDescription)
        }.disposed(by: disposeBag)
    }
    
    // MARK: Handle Show Hide
    @IBAction func handleShowHide(_ sender: UIButton){
        if sender.tag == 0 {
            self.passwordTextField.isSecureTextEntry = false
            sender.tag = 1
            sender.setTitle("Hide", for: .normal)
        }else {
            self.passwordTextField.isSecureTextEntry = true
            sender.tag = 0
            sender.setTitle("Show", for: .normal)
        }
        
    }
    
    // MARK: Handle SignUp
    private func handleSignUp(userType:UserType,_ sender: RoundButton){
        guard let email = self.emailAddressTextField.text, email != "",
        emailValidator.validate(email) else {return}
        guard let password = self.passwordTextField.text, password != "" else {return}
        sender.showLoading()
        LoginRequest.shared.signUp(email: email, password: password, userType: userType).subscribe(onSuccess: { (result) in
            sender.hideLoading()
          if result?.status == 200 || result?.status == 201 {
              (UIApplication.shared.delegate as! AppDelegate).loadChefUI(viewController: self)
          }
            debugPrint("result:",result as Any)
        }) { (error) in
            sender.hideLoading()
            debugPrint("error:",error.localizedDescription)
        }.disposed(by: disposeBag)
    }
 
    // MARK: Setup UI
    private func setupUI(){
        self.emailAddressTextField.delegate = self
        self.passwordTextField.delegate = self
        self.segmentControl.barTintColor = UIColor(red: 234/255, green: 29/255, blue: 44/255, alpha: 1)
        self.passwordShowHideButton.contentHorizontalAlignment = .right
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
}
