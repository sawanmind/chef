//
//  SelectCategoryModal.swift
//  Housefood
//
//  Created by Oluha group on 8/11/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

class SelectCategoryModal: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: Actions
    @IBAction func btnClickOk(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnClickCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
