//
//  Tweet.swift
//  TwitterMockUp
//
//  Created by Guest User on 11/18/18.
//  Copyright © 2018 taimoor.com. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Tweet {
    let user: User
    let message: String
    
    init(json: JSON) {
        let userJson = json["user"]
        self.user = User(json: userJson)
        
        self.message = json["message"].stringValue
    }
    
}
