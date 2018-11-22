//
//  Service.swift
//  TwitterMockUp
//
//  Created by Guest User on 11/20/18.
//  Copyright © 2018 taimoor.com. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    static let sharedInstance = Service()
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROR")
        }
    }
    
    func fetchHomeFeed(completion:@escaping (HomeDatasource)->()) {
        print("Fetching homefeed")
        
        let request: APIRequest<HomeDatasource, JSONError> = tron.swiftyJSON.request("/twitter/home")
        
        request.perform(withSuccess: { (homeDataSouce) in
            print("Sucessfully fetched our json objects")
            print(homeDataSouce.users.count)
            
            completion(homeDataSouce)

        }) { (err) in
            print("Failed to fetch json..", err)
        }
    }
}
