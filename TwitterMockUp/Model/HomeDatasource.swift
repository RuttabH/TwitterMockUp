//
//  HomeDatasource.swift
//  TwitterMockUp
//
//  Created by TAMUR on 08/11/2018.
//  Copyright © 2018 taimoor.com. All rights reserved.
//


import UIKit
import LBTAComponents

class HomeDatasource: Datasource {
    
    let users: [User] = {
       
        let brianUser = User(name: "Brian Voong", username: "@btothebrianVoong", bioText: "iPhone, iPad, iOS Programming Community. Joing us to learn swift, objective C and build iOS apps!", profileImage: #imageLiteral(resourceName: "profile_image"))
        
        let rayUser = User(name: "Ray Wenderlich", username: "@raywenderlich", bioText: "Raywenderlich is an iPhone developer and also tweet about topic related to iphone, gaming and technology. Checkout our conferences.", profileImage: #imageLiteral(resourceName: "ray_profile_image"))
        
         let algorithmCourseUser = User(name: "Algorithm Course", username: "learnitquick", bioText: "This recent released course on https://video.letsbuildthatapp.com/basic-training provides some excellent guidance on how to use UITableView and UICollectionView. This course also teaches some basic on the Swift language, for exampleif statements and For Loops. This will be an excellent purchase for you ", profileImage: #imageLiteral(resourceName: "profile_image"))
        
        return [brianUser,rayUser,algorithmCourseUser]
    }()
    
    let words = ["user1","user2","user3"]
    
    let tweets: [Tweet] = {
        
        let brianUser = User(name: "Brian Voong", username: "@btothebrianVoong", bioText: "iPhone, iPad, iOS Programming Community. Joing us to learn swift, objective C and build iOS apps!", profileImage: #imageLiteral(resourceName: "profile_image"))
        
        let tweet = Tweet(user: brianUser, message: "Welkcome to episode 9 of the Twitter series, really hope your enoying the series so far. I really really ned a long text blcok to render out so we're going to stop here!")
        
        let tweet2 = Tweet(user: brianUser, message: "This is the second tweet for our sample project. very very exciting message..")
        
        return[tweet,tweet2]
    }()
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweets.count
        }
        return users.count
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return tweets[indexPath.item]
        }
        return users[indexPath.item]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self,TweetCell.self]
    }
}
