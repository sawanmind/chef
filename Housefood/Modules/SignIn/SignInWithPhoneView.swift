//
//  SignInWithPhoneView.swift
//  Housefood
//
//  Created by Eric Hodgins on 2019/07/10.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInWithPhoneView: UIViewController {

    @IBOutlet weak var verifyView: UIView!
    @IBOutlet weak var phoneNumberField: TextInput!
    @IBOutlet weak var firstField: UITextField!
    @IBOutlet weak var secondField: UITextField!
    @IBOutlet weak var thirdField: UITextField!
    @IBOutlet weak var fourthField: UITextField!
    
    var userType: UserType!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        firstField.delegate = self
        secondField.delegate = self
        thirdField.delegate = self
        fourthField.delegate = self
        firstField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        secondField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        thirdField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        fourthField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
    }
    
    @IBAction func sendClick(_ sender: Any) {
        self.verifyView.isHidden = false
//        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumberField.text!, uiDelegate: nil) { (verificationID, error) in
//            if error == nil {
//                UserDefaults.standard.set(verificationID, forKey: UserData.verificationID.rawValue)
//                self.verifyView.isHidden = false
//            } else {
//                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
//                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//                self.present(alert, animated: true, completion: nil)
//            }
//        }
    }
    
    @IBAction func verifyClick(_ sender: Any) {
        switch userType! {
        case .user:
            self.present(UIStoryboard(name: "UserInfoSetup", bundle: nil).instantiateInitialViewController()!, animated: true, completion: nil)
            break
        case .chef:
            self.present(UIStoryboard(name: "RestaurantProfileSetup", bundle: nil).instantiateInitialViewController()!, animated: true, completion: nil)
        }
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: UserDefaults.standard.string(forKey: "authVerificationID")!, verificationCode: firstField.text!+secondField.text!+thirdField.text!+fourthField.text!)
        Auth.auth().signIn(with: credential) { (result, error) in
            if error == nil {
                UserDefaults.standard.set(self.userType, forKey: UserData.user_type.rawValue)
                UserDefaults.standard.set(result?.user.uid, forKey: UserData.userUID.rawValue)
                UserDefaults.standard.set(self.phoneNumberField.text, forKey: UserData.phone.rawValue)
            } else {
                self.showErrorMessage(message: error!.localizedDescription)
            }
        }
    }
    
    @IBAction func resendClick(_ sender: Any) {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumberField.text!, uiDelegate: nil) { (verificationID, error) in
            if error == nil {
                UserDefaults.standard.set(verificationID, forKey: UserData.verificationID.rawValue)
            } else {
                self.showErrorMessage(message: error!.localizedDescription)
            }
        }
    }
    
    @IBAction func changeNumberClick(_ sender: Any) {
        phoneNumberField.text = ""
        verifyView.isHidden = true
    }
    
    @IBAction func dismissClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func sendVerificationCode() {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumberField.text!, uiDelegate: nil) { (verificationID, error) in
            if error == nil {
                UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
                self.verifyView.isHidden = false
            } else {
                
            }
        }
    }
    
    func showErrorMessage(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SignInWithPhoneView: UITextFieldDelegate {
    @objc func textFieldDidChange(textField: UITextField) {
        if textField.text?.count ?? 0 > 0 {
            switch textField.tag {
            case 1:
                secondField.becomeFirstResponder()
                print("first")
                break
            case 2:
                thirdField.becomeFirstResponder()
                print("second")
                break
            case 3:
                fourthField.becomeFirstResponder()
                break
            case 4:
                self.view.endEditing(true)
            default:
                break
            }
        }
    }
}
