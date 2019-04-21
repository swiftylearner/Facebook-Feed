//
//  UserModel.swift
//  TableView
//
//  Created by MacBook on 4/21/19.
//  Copyright © 2019 Apptive. All rights reserved.
//

import UIKit

struct UserModel {
    
    var userImage:UIImage!
    var postImage:UIImage!
    var userName:String
    var postDate:String
    var caption:String
    
    init(userImage:String,postImage:String,userName:String,postDate:String,caption:String) {
        self.userImage = UIImage(named: userImage)
        self.postImage = UIImage(named: postImage)
        self.userName = userName
        self.postDate = postDate
        self.caption = caption
    }
    
}
