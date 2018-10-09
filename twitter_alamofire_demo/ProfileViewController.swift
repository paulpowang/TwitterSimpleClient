//
//  ProfileViewController.swift
//  twitter_alamofire_demo
//
//  Created by paul on 10/7/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    
    
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var screenname: UILabel!
    
    @IBOutlet weak var followerCount: UILabel!
    @IBOutlet weak var followingCount: UILabel!
    
    @IBOutlet weak var tweetCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIManager.shared.getCurrentAccount{(user:User?, error: Error?) in
            if let  error = error {
                print("Error: \(error.localizedDescription)")
                
            }else if let user = user {
                self.username.text = user.name
                self.screenname.text = "@\(user.screenName)"
                self.followingCount.text = String(user.followingCount)
                self.followerCount.text = String(user.followerCount)
                self.tweetCount.text = String(user.tweetCount)
                
                self.profileImage.af_setImage(withURL: user.profile_image_url)
                
                
            }
        }
        
        
    }

}
