//
//  FavouriteTab.swift
//  Housefood
//
//  Created by Eric Hodgins on 2019/07/11.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

class FavouriteTab: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = FavouriteTabModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
