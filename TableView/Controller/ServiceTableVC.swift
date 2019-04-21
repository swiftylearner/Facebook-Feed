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
    
    
    // MARK: -  Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // register cell
        tableView.register(ServiceCell.self, forCellReuseIdentifier: serviceCellId)
    }


    // MARK: - Configure views
    
    
    
    // MARK: - Selectors
    
    
    
    // MARK: - Helper Methods
    
}


// MARK: - delegate and datasource
extension ServiceTableVC  {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: serviceCellId, for: indexPath) as? ServiceCell else {return UITableViewCell()}
        
        return cell
    }
}
