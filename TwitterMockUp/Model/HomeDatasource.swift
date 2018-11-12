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
       
        let brianUser = User(name: "Brian Voong", username: "@btothebrianVoong", bioText: "iPhone, iPad, iOS Programming Community. Joing us to learn swift, objective C and build iOS apps!", profileImage: UIImage(named: "profile_image")!)
        
        let rayUser = User(name: "Ray Wenderlich", username: "@raywenderlich", bioText: "Raywenderlich is an iPhone developer and also tweet about topic related to iphone, gaming and technology. Checkout our conferences.", profileImage: UIImage(named: "profile_image")!)
        
        
        return [brianUser,rayUser]
    }()
    
    let words = ["user1","user2","user3"]
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return users.count
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return users[indexPath.item]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
}
