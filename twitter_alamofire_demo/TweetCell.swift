//
//  TimelineCell.swift
//  twitter_alamofire_demo
//
//  Created by paul on 9/30/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage


class TweetCell: UITableViewCell {
    
    
    

    
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var authorName: UILabel!
    
    @IBOutlet weak var tweetText: UILabel!
    
    
    var tweetPost: Tweet!{
        didSet{
            let user = tweetPost.user
            let favoriteCount = tweetPost.favoriteCount
            let id = tweetPost.id
            let retweetCount = tweetPost.retweetCount
            let retweeted = tweetPost.retweeted
            let retweetUser = tweetPost.retweetedByUser
            let createdAtString = tweetPost.createdAtString
            let favorited = tweetPost.favorited
        
            let text = tweetPost.text
            let screenName = tweetPost.user?.screenName
            let userid = tweetPost.user?.id
            
            
            authorName.text = user?.name
            tweetText.text = text
            //let profile_image_url = URL(String: user?.profile_image_url)!
            
            
            //profileImage.af_setImage(withURL: profile_image_url)
            
            //profileImage.loadInBackground()
            
            
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
