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
    let userImage:UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.backgroundColor = .red
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "lebron")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isUserInteractionEnabled = true
        return image
    }()
    
    let sharedImage:UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.backgroundColor = .red
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "party")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let userNameLabel:UILabel = {
        let label = UILabel()
        label.text = "John Doe"
        label.configureLabel(size: 16, color: .black, bold: .bold)
        return label
    }()
    
    let timeStampLabel:UILabel = {
        let label = UILabel()
        let attribute = NSMutableAttributedString(string: "3hrs ago ", attributes: [NSAttributedString.Key.foregroundColor:UIColor.lightGray])
        attribute.append(NSAttributedString(string: "⚾︎", attributes: nil))
        label.attributedText = attribute
        label.configureLabel(size: 15, color: .lightGray, bold: nil)
        return label
    }()
    
    let captionLabel:UILabel = {
        let label = UILabel()
        label.text = "people will celebrate others for the very things they cretize lebron"
        label.numberOfLines = 0
        label.configureLabel(size: 18, color: .black, bold: nil)
        return label
    }()
    
    lazy var stackView:UIStackView = {
        let stack = UIStackView()
        stack.addArrangedSubview(userNameLabel)
        stack.addArrangedSubview(timeStampLabel)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 0
        stack.axis = .vertical
        return stack
    }()
    
    let containerView:UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()

    var delegate : userPostDelegate?
    var userModel:UserModel? {
        didSet{
            guard let user = userModel else {return}
            userImage.image = user.userImage
            userNameLabel.text = user.userName
            sharedImage.image = user.postImage
            timeStampLabel.text = user.postDate
            captionLabel.text = user.caption
        }
    }
    
    // MARK: -  Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureViews()
        tapGestureRecognizer()
        selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Configure views
    fileprivate func configureViews(){
        let padding : CGFloat = 8
        let deminsion : CGFloat = 80
        
        backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        // container view
        addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            containerView.leftAnchor.constraint(equalTo: leftAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.rightAnchor.constraint(equalTo: rightAnchor),
        ])
        
        // user image
        containerView.addSubview(userImage)
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            userImage.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: padding),
            
            // height and width
            userImage.heightAnchor.constraint(equalToConstant: deminsion),
            userImage.widthAnchor.constraint(equalToConstant: deminsion)
        ])
        
        userImage.layer.cornerRadius = deminsion / 2
        
        // stack view
        containerView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: userImage.rightAnchor, constant: padding),
            stackView.centerYAnchor.constraint(equalTo: userImage.centerYAnchor)
            
        ])
        
        // caption label
        containerView.addSubview(captionLabel)
        NSLayoutConstraint.activate([
            captionLabel.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: padding),
            captionLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor,constant: padding),
            captionLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -padding)
        ])
        
     
        // shared image
        containerView.addSubview(sharedImage)
        NSLayoutConstraint.activate([
            sharedImage.topAnchor.constraint(equalTo: captionLabel.bottomAnchor, constant: padding),
            sharedImage.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            sharedImage.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            sharedImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -padding),
            
            sharedImage.heightAnchor.constraint(equalToConstant: 250)
        ])
        

        
    }
    
    
    // MARK: - Selectors
    @objc func userImageTapped(){
        delegate?.handleUserImageTapped(cell: self)
    }
    
    
    // MARK: - Helper Methods
    fileprivate func tapGestureRecognizer(){
        let tap = UITapGestureRecognizer()
        tap.numberOfTapsRequired = 1
        tap.addTarget(self, action: #selector(userImageTapped))
        userImage.addGestureRecognizer(tap)
    }
}
