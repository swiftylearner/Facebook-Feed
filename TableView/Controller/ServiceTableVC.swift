//
//  ViewController.swift
//  TableView
//
//  Created by MacBook on 4/20/19.
//  Copyright © 2019 Apptive. All rights reserved.
//

import UIKit
private let serviceCellId = "serviceCell"


class ServiceTableVC: UITableViewController {
    
    // MARK: - Properties
    var user : [UserModel] = []
    
    // MARK: -  Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // register cell
        tableView.register(ServiceCell.self, forCellReuseIdentifier: serviceCellId)
        tableView.reloadData()
        
        // create users
        user.append(UserModel(userImage: "lebron", postImage: "party", userName: "King James", postDate: "3hrs ago", caption: "next year will a year to remember"))
        
    }


    // MARK: - Configure views
    
    
    
    // MARK: - Selectors
    
    
    
    // MARK: - Helper Methods
    
}


// MARK: - delegate and datasource
extension ServiceTableVC  {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: serviceCellId, for: indexPath) as? ServiceCell else {return UITableViewCell()}
        cell.userModel = user[indexPath.row]
        cell.delegate = self
        return cell
    }
}


// MARK: - Handle Image Tappped
extension ServiceTableVC : userPostDelegate {
    
    func handleUserImageTapped(cell: ServiceCell) {
        let profileVC = ProfileVC()
        navigationController?.pushViewController(profileVC, animated: true)
    }

}
