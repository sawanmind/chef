//
//  SecondViewController.swift
//  Housefood
//
//  Created by Eric Hodgins on 2019/07/05.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

class OrdersTab: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var orders = [History]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HistoryCell", bundle: nil), forCellReuseIdentifier: "cell")
    }


}

extension OrdersTab: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HistoryCell
//        let history = orders[indexPath.row]
//        cell.set(name: history.name, detail: history.detail, status: history.status, thumbnail: history.thumbnail)
        return cell
    }
}
