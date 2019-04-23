//
//  ViewController.swift
//  TableView
//
//  Created by MacBook on 4/20/19.
//  Copyright © 2019 Apptive. All rights reserved.
//

import UIKit
private let CellId = "serviceCell"


class PostFeedTableVC: UITableViewController {
    
    // MARK: - Properties
    var user : [UserModel] = []
    var userSearchResult : [UserModel] = []
    var searchController : UISearchController!
  
    
    // MARK: -  ====== Life Cycle ========
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        registerCell()
        createUsers()
        
    }


    // MARK: - ===== Configure views =====
    fileprivate func setupSearchController(){
        view.backgroundColor = Theme.tableViewGray
        
        searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        searchController.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "search users"
        searchController.searchBar.backgroundColor = .white
        searchController.searchBar.autocapitalizationType = .none
        definesPresentationContext = true
    }

    
    // MARK: -  ====== Helper Methods ========
    fileprivate func createUsers(){
        user = [
            UserModel(userImage: "lebron", postImage: "party", userName: "King James", postDate: "2hrs ago", caption: "next year will be different"),
            UserModel(userImage: "kids", postImage: "lakers", userName: "The Kids", postDate: "3hrs ago", caption: "next year will a year to remember"),
            UserModel(userImage: "bridge", postImage: "court", userName: "Ball Game", postDate: "3hrs ago", caption: "next year will a year to remember")
        ]
    }
    
    fileprivate func registerCell(){
        let nibTableViewCell = UINib(nibName: "UserPostCell", bundle: nil)
        tableView.register(nibTableViewCell, forCellReuseIdentifier: CellId)
        tableView.reloadData()
    }
    
}


// MARK: - ====== delegate and datasource ======
extension PostFeedTableVC  {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return userSearchResult.count
        }else{
            return user.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellId, for: indexPath) as? UserPostCell else {return UITableViewCell()}
        
        let users = searchController.isActive ? userSearchResult[indexPath.row] : user[indexPath.row]
        cell.userModel = users
        cell.delegate = self
        return cell
    }
}


// MARK: - ====== Handle Image Tappped ======
extension PostFeedTableVC : userPostDelegate {

    
    func handleUserImageTapped(cell: UserPostCell) {
        let profileVC = ProfileVC()
        profileVC.user = cell.userModel
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    func handleLikeTappedFor(user: UserModel?) {
        guard let user = user else {return}
        print(user.userName)
    }
    
    func handleCommentTappedFor(user: UserModel?) {
        guard let user = user else {return}
        print(user.userName)
    }
    
    func handleSharedTappedFor(user: UserModel?) {
        guard let user = user else {return}
        print(user.caption)
    }

}


// MARK: - ======= Handle Fitching =======
extension PostFeedTableVC : UISearchResultsUpdating, UISearchControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            filterContent(searchText: searchText)
            tableView.reloadData()
        }
    }
    
    
    fileprivate func filterContent(searchText:String){
        userSearchResult = user.filter({ (users) -> Bool in
            return users.userName.lowercased().contains(searchText)
        })
        
    }
    
}
