//
//  Protocol.swift
//  TableView
//
//  Created by MacBook on 4/21/19.
//  Copyright © 2019 Apptive. All rights reserved.
//

import Foundation

protocol userPostDelegate {
    func handleUserImageTapped(cell:UserPostCell)
    func handleLikeTappedFor(user:UserModel?)
    func handleCommentTappedFor(user:UserModel?)
    func handleSharedTappedFor(user:UserModel?)
}
