//
//  NotificationViewController.swift
//  Housefood
//
//  Created by Oluha group on 8/19/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {

    @IBOutlet var notificationTable: UITableView!
    fileprivate var notificationArray = [ChefNotification]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationTable.register(UINib(nibName: NibName.NotificationTableViewCell, bundle: nil), forCellReuseIdentifier: ReuseIdentifiers.NotificationTableViewCell)
        
        notificationArray.append(ChefNotification(name: "", time: ""))
    }
    
}

extension NotificationViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.NotificationTableViewCell, for: indexPath) as! NotificationTableViewCell
        return cell
    }

}

extension NotificationViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76
    }
}

struct ChefNotification {
    var name: String
    var time: String
}
