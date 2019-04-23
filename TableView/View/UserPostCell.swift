//
//  UserPostCell.swift
//  TableView
//
//  Created by MacBook on 4/22/19.
//  Copyright © 2019 Apptive. All rights reserved.
//

import UIKit

class UserPostCell: UITableViewCell {
    
    // MARK - Properties
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var timeStamp: UILabel!
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    
    var delegate : userPostDelegate?
    
    var userModel:UserModel? {
        didSet{
            guard let user = userModel else {return}
            userImage.image = user.userImage
            username.text = user.userName
            timeStamp.text = user.postDate
            postLabel.text = user.caption
            postImage.image = user.postImage
        }
    }

    // MARK: - Init
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        postLabel.numberOfLines = 0
        userImage.contentMode = .scaleAspectFill
        userImage.layer.cornerRadius = userImage.frame.size.height / 2
        
        postImage.contentMode = .scaleAspectFill
        userImage.isUserInteractionEnabled = true
        
        tapGestureRecognizer()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

    
    // MARK: - Functions
    @objc func userImageTapped(){
        delegate?.handleUserImageTapped(cell: self)
    }
    
    
    @IBAction func likeButton(_ sender: Any) {
        delegate?.handleLikeTappedFor(user: userModel)
    }
    
    @IBAction func commentButton(_ sender: Any) {
        delegate?.handleCommentTappedFor(user: userModel)
    }
    
    @IBAction func shareButton(_ sender: Any) {
        delegate?.handleSharedTappedFor(user: userModel)
    }
    
    // MARK: - Helper Methods
    fileprivate func tapGestureRecognizer(){
        let tap = UITapGestureRecognizer()
        tap.numberOfTapsRequired = 1
        tap.addTarget(self, action: #selector(userImageTapped))
        userImage.addGestureRecognizer(tap)
    }
    
}
