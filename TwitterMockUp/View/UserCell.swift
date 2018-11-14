//
//  UserCell.swift
//  TwitterMockUp
//
//  Created by TAMUR on 12/11/2018.
//  Copyright © 2018 taimoor.com. All rights reserved.
//

import UIKit
import LBTAComponents

class UserCell: DatasourceCell {
    
    
    override var datasourceItem: Any? {
        didSet {
            print(datasourceItem)
            
            guard let user = datasourceItem as? User else {return}
            nameLabel.text = user.name
            usernameLabel.text = user.username
            bioTextView.text = user.bioText
            
            
            let image = UIImage()
            
            profileImageView.image = user.profileImage
        }
    }
    
    //MARK: PROPERTIES
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "John Doe"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "@BuildingTheApp"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(r: 130, g: 130, b: 130)
        return label
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.image = UIImage(named:"profile_image")
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let bioTextView: UITextView = {
        let textView = UITextView()
        //textView.backgroundColor = .yellow
        textView.text = "iPhone, iPad, iOS Programming Community. Joing us to learn swift, objective C and build iOS apps!"
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.backgroundColor = .clear //textview has a default background color of white which we dont want in his case
        return textView
    }()
    
    let followButton: UIButton = {
        let button = UIButton()
        button.layer.borderColor = twitterBlue.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.setTitle("Follow", for: .normal)
        button.setTitleColor(twitterBlue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setImage(#imageLiteral(resourceName: "follow"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0) //to change insets of button image
        //button.titleEdgeInsets = UIEdgeInsets // to change button title inset
        return button
    }()
    
    
    //    override var datasourceItem: Any? {
    //        didSet {
    //            nameLabel.text = datasourceItem as? String
    //        }
    //    }
    
    
    
    //MARK: FUNCTIONS
    override func setupViews() {
        super.setupViews()
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(usernameLabel)
        addSubview(bioTextView)
        addSubview(followButton)
        
        backgroundColor = .white
        
        super.separatorLineView.isHidden = false
        super.separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        usernameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        bioTextView.anchor(usernameLabel.bottomAnchor, left: usernameLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: -4, leftConstant: -4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        followButton.anchor(topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 34)
    }
}
