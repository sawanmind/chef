//
//  ProfileView.swift
//  Housefood
//
//  Created by Eric Hodgins on 2019/07/05.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

class ProfileTab: UIViewController {

    @IBOutlet weak var thumbnailView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        if UserDefaults.standard.string(forKey: UserData.profile_image_url.rawValue) != nil {
            thumbnailView.af_setImage(withURL: URL(string: UserDefaults.standard.string(forKey: UserData.profile_image_url.rawValue)!)!)
        }
        nameLabel.text = UserDefaults.standard.string(forKey: UserData.name.rawValue)
        profileLabel.text = UserDefaults.standard.string(forKey: UserData.profile.rawValue)
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

extension ProfileTab: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "address", for: indexPath)
            cell.textLabel?.text = "address"
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "phone", for: indexPath)
            cell.textLabel?.text = "Phone"
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "email", for: indexPath)
            cell.textLabel?.text = "Email"
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = ""
            return cell
        }
    }
}
