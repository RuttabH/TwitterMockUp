//
//  TweetCell.swift
//  TwitterMockUp
//
//  Created by Guest User on 11/13/18.
//  Copyright © 2018 taimoor.com. All rights reserved.
//

import LBTAComponents


class TweetCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            guard let tweet = datasourceItem as? Tweet else {return}
            
            //We have only one textview which we are using to show username, name and textmessage thus we are using attributedString to chnage attributes like color,size and even get gap.
            //This way we dont have to create multiple uiviews for name,username and message
            let attributedText = NSMutableAttributedString(string: tweet.user.name, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 16)])
            
            let usernameString = " \(tweet.user.username)\n"
            attributedText.append(NSAttributedString(string:usernameString, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15),NSAttributedStringKey.foregroundColor: UIColor.gray]))
            
            //This is used to create gap between usernameString and tweet.message(down below)
            //We dont want tweet.message to get gap thus this code is written above tweet.message attributeString
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            let range = NSMakeRange(0, attributedText.string.characters.count)
            attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: range)
            
            attributedText.append(NSAttributedString(string:tweet.message, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]))
            
            self.messageTextView.attributedText = attributedText
            
        }
    }
    
    var messageTextView: UITextView = {
       let tv = UITextView()
        tv.text = "SOME SAMPLE TEXT"
       // tv.backgroundColor = .yellow
        return tv
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
    
    let replyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "reply"), for: .normal)
        return button
    }()
    
    let retweetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "retweet"), for: .normal)
        return button
    }()
    
    
    override func setupViews() {
        super.setupViews()
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        backgroundColor = .white
        
        addSubview(profileImageView)
        addSubview(messageTextView)
        addSubview(replyButton)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        messageTextView.anchor(topAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        replyButton.anchor(nil, left: messageTextView.leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        setUpBottomButtons()
    }

    fileprivate func setUpBottomButtons()  {
        let replyButtonContainerView = UIView()
        replyButtonContainerView.backgroundColor = .red
       
        let retweetButtonContainerView = UIView()
        retweetButtonContainerView.backgroundColor = .blue
        
        let likeButtonContainerView = UIView()
        likeButtonContainerView.backgroundColor = .green
        
        let directMessageButtonContainerView = UIView()
        directMessageButtonContainerView.backgroundColor = .purple
        
        let buttonStackView = UIStackView(arrangedSubviews: [replyButtonContainerView,retweetButtonContainerView,likeButtonContainerView,directMessageButtonContainerView])
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        
        addSubview(buttonStackView)
        buttonStackView.anchor(nil, left: messageTextView.leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        addSubview(replyButton)
        addSubview(replyButton)
        
        replyButton.anchor(replyButtonContainerView.topAnchor, left: replyButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        replyButton.anchor(replyButtonContainerView.topAnchor, left: replyButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
    }
    

}
