//
//  User.swift
//  twitter_alamofire_demo
//
//  Created by paul on 9/28/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import Foundation


class User{
    var name: String
    var screenName: String
    var id: Int64
    var profile_image_url: URL
    
    
    init(dictionary: [String: Any]) {
        name = (dictionary["name"] as? String)!
        screenName = (dictionary["screen_name"] as? String)!
        id = dictionary["id"] as! Int64
        // Initialize any other properties
        //profile_image_url = dictionary["profile_image_url_https"] as! String
        profile_image_url = URL(string: dictionary["profile_image_url_https"] as! String)!
        
    }
    
    static var current: User?
}
