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
    var backgroundImageUrl: URL
    var followingCount: Int?
    var followerCount: Int?
    var dict: [String: Any]?
    
    private static var _current: User?
    
    
    init(dictionary: [String: Any]) {
        name = (dictionary["name"] as? String)!
        screenName = (dictionary["screen_name"] as? String)!
        id = dictionary["id"] as! Int64
        // Initialize any other properties
        //profile_image_url = dictionary["profile_image_url_https"] as! String
        profile_image_url = URL(string: dictionary["profile_image_url_https"] as! String)!
        
        if !(dictionary["profile_banner_url"] == nil){
            backgroundImageUrl = URL(string: dictionary["profile_banner_url"] as! String)!
        }else{
            backgroundImageUrl = URL(string: "nil")!
        }
        
        followerCount = dictionary["friends_count"] as? Int
        followerCount = dictionary["followers_count"] as? Int
    }
    
    
    static var current: User? {
        get{
            if _current == nil {
                let defaults = UserDefaults.standard
                if let userDate = defaults.data(forKey: "currentUserData"){
                    let dict = try! JSONSerialization.jsonObject(with: userDate, options: []) as! [String: Any]
                    _current = User(dictionary: dict)
                }
            }
            return _current
        }
        
        set(user){
            _current = current
            let defaults = UserDefaults.standard
            if let user = user {
                let data = try! JSONSerialization.data(withJSONObject: user.dict!, options: [])
                defaults.set(data, forKey: "currentUserData")
            }else{
                defaults.removeObject(forKey: "currentUserData")
            }
        }
        
    }
    
}
