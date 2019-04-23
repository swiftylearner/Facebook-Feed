//
//  UserProfileVC.swift
//  TableView
//
//  Created by MacBook on 4/23/19.
//  Copyright © 2019 Apptive. All rights reserved.
//

import UIKit
private let cellId = "profileCell"

class UserProfileController: UITableViewController {
    
    // MARK: - ===== PROPERTIES ======
    var user : UserModel?
    var userArray:[UserModel] = []
    
    // MARK: - ====== View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        setupUser()
    }
    
    // MARK: - ===== REGISTER CELL ========
    fileprivate func registerCell(){
        let nibTableViewCell = UINib(nibName: "UserPostCell", bundle: nil)
        tableView.register(nibTableViewCell, forCellReuseIdentifier: cellId)
    }
    
    fileprivate func setupUser(){
        guard let user = user else { return }
        userArray.append(user)
        tableView.reloadData()
    }
    
}

// MARK: - ======== DATA SOURCE =======
extension UserProfileController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? UserPostCell else {return UITableViewCell()}
        cell.userModel = userArray[indexPath.row]
        return cell
    }
}
