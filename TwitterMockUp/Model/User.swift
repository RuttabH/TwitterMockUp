//
//  User.swift
//  TwitterMockUp
//
//  Created by TAMUR on 12/11/2018.
//  Copyright © 2018 taimoor.com. All rights reserved.
//

import UIKit
import SwiftyJSON


struct User {
    let name: String
    let username: String
    let bioText: String
    let profileImage: UIImage
    
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.username = json["username"].stringValue
        self.bioText = json["bio"].stringValue
        self.profileImage = UIImage()
    }
    
}
