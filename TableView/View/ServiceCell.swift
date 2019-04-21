//
//  ServiceCell.swift
//  TableView
//
//  Created by MacBook on 4/20/19.
//  Copyright © 2019 Apptive. All rights reserved.
//

import UIKit

class ServiceCell : UITableViewCell {

    // MARK: - Properties
    
    
    // MARK: -  Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("cell has been register")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Configure views
    
    
    
    // MARK: - Selectors
    
    
    
    // MARK: - Helper Methods
}
