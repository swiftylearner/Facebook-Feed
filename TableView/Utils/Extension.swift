//
//  Extension.swift
//  TableView
//
//  Created by MacBook on 4/21/19.
//  Copyright © 2019 Apptive. All rights reserved.
//

import UIKit

// UILabel
extension UILabel {
    func configureLabel(size:CGFloat,color:UIColor,bold:UIFont.Weight?){
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont.systemFont(ofSize:size, weight: bold ?? UIFont.Weight.regular)
        textColor = color
    }
}


// UIButton
extension UIButton {
    
    func configureButton(image:String,category:String){
        translatesAutoresizingMaskIntoConstraints = false
        setImage(UIImage(named: image)?.withRenderingMode(.alwaysOriginal), for: .normal)
        let attribute = NSMutableAttributedString(string: category, attributes: [NSAttributedString.Key.foregroundColor:UIColor.lightGray])
        self.setAttributedTitle(attribute, for: .normal)
    }
    
}
