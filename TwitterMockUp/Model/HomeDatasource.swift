//
//  HomeDatasource.swift
//  TwitterMockUp
//
//  Created by TAMUR on 08/11/2018.
//  Copyright © 2018 taimoor.com. All rights reserved.
//


import UIKit
import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasource: Datasource, JSONDecodable {
    
    var users = [User]()
    
    required init(json: JSON) throws {

        let userJsonArray = json["users"].array
        
        //map functions iterate through each elements of the userJsonArray,
        //Using the current iteration value to create a new User object and then return it
        //the returned object is added to the self.users array
        self.users = userJsonArray!.map{ User(json: $0)}
        
        let tweetsJsonArray = json["tweets"].array
        self.tweets = tweetsJsonArray!.map{Tweet(json: $0)}
    }
    
    

    
    let words = ["user1","user2","user3"]
    
    let tweets: [Tweet]
    
    
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
