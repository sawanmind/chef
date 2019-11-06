//
//  LoginViewModel.swift
//  Housefood
//
//  Created by Oluha group on 2019/07/06.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit
import RxSwift

class LoginViewModel: NSObject {

    let disposeBag = DisposeBag()
    
    func signIn(with email: String, password: String) -> Completable {
        return Completable.create { (completable) -> Disposable in
            LoginRequest.shared.signIn(email: email, password: password).subscribe(onSuccess: { (response) in
                //Save User info at here
                completable(.completed)
            }) { (error) in
                completable(.error(error))
            }.disposed(by: self.disposeBag)
            return Disposables.create()
        }
    }
}
