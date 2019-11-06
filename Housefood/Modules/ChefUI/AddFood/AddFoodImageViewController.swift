//
//  AddFoodImageViewController.swift
//  Housefood
//
//  Created by Oluha group on 8/3/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

class AddFoodImageViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgSelected: RoundImage!
    
    var selectedImageItem : PhotoItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        setImageText()
        self.navigationController?.navigationBar.topItem?.title = "";
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    fileprivate func setImageText() {
        lblTitle.text = selectedImageItem?.title
    }
    
    //MARK: Actions
    @IBAction func btnClickedUploadPhoto(_ sender: UIButton) {
        
    }
}
