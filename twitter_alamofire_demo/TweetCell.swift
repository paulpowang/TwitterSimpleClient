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
    
    @IBOutlet weak var accountName: UILabel!
    
    @IBOutlet weak var createByDate: UILabel!
    
    @IBOutlet weak var favorCount: UILabel!
    @IBOutlet weak var retweetCount: UILabel!
    @IBOutlet weak var replayCount: UILabel!
    
    
    @IBOutlet weak var retweetButton: UIButton!
    
    @IBOutlet weak var favorButton: UIButton!
    
    var tweetPost: Tweet!{
        didSet{
            let user = tweetPost.user
            let favoriteCount = tweetPost.favoriteCount
            
            let id = tweetPost.id
            let retweetNum = tweetPost.retweetCount
            let retweeted = tweetPost.retweeted
            let retweetUser = tweetPost.retweetedByUser
            let createdAtString = tweetPost.createdAtString
            let favorited = tweetPost.favorited
        
            let text = tweetPost.text
            
            
            
            if let count = favoriteCount{
                favorCount.text = String(count)
            }else{
                favorCount.text = "0"
            }
            if let count = retweetNum{
                retweetCount.text = String(count)
            }else{
                retweetCount.text = "0"
            }
            createByDate.text = createdAtString
            accountName.text = user?.screenName
            authorName.text = user?.name
            tweetText.text = text
    
            
            
       
            profileImage.af_setImage(withURL: (user?.profile_image_url)!)
            
            
            
            
            
        }
        
        
    }
    
    @IBAction func favorButtonPress(_ sender: Any) {
        if(!(tweetPost.favorited!)){
            let image = UIImage(named: "favor-icon-red")
            favorButton.setImage(image, for: UIControlState.normal)
            tweetPost.favorited = true
            
            APIManager.shared.favorite(tweetPost) { (ntweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let ntweet = ntweet {
                    print("Successfully favorited the following Tweet")
                    let count = ntweet.favoriteCount!
                    self.favorCount.text = String(count)
                }
            }
        }else {
            let image = UIImage(named: "favor-icon")
            favorButton.setImage(image, for: UIControlState.normal)
            tweetPost.favorited = false
            APIManager.shared.unfavorite(tweetPost) { (ntweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error unfavoriting tweet: \(error.localizedDescription)")
                } else if let ntweet = ntweet {
                    print("Successfully unfavorited the following Tweet")
                    let count = ntweet.favoriteCount!
                    self.favorCount.text = String(count)
                }
            }
        }
    }
    
    @IBAction func retweetButtonPress(_ sender: Any) {
        if(!(tweetPost.retweeted!)){
            let image = UIImage(named: "retweet-icon-green")
            retweetButton.setImage(image, for: UIControlState.normal)
            
            tweetPost.retweeted = true
            APIManager.shared.retweet(tweetPost) { (ntweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error retweet tweet: \(error.localizedDescription)")
                } else if let ntweet = ntweet {
                    print("Successfully retweet the following Tweet")
                    let count = ntweet.retweetCount!
                    self.retweetCount.text = String(count)
                }
            }
        }else {
            let image = UIImage(named: "retweet-icon")
            retweetButton.setImage(image, for: UIControlState.normal)
            
            tweetPost.retweeted = false
            APIManager.shared.unretweet(tweetPost) { (ntweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error unretweet tweet: \(error.localizedDescription)")
                } else if let ntweet = ntweet {
                    print("Successfully unretweet the following Tweet")
                    let count = ntweet.retweetCount!
                    self.retweetCount.text = String(count)
                }
            }
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
