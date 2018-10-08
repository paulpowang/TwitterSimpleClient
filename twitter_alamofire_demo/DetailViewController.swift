//
//  DetailViewController.swift
//  twitter_alamofire_demo
//
//  Created by paul on 10/7/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    var tweet: Tweet!

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    //@IBOutlet weak var selectedIcon: UIImageView!
    @IBOutlet weak var screenname: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var retweetCount: UILabel!
    @IBOutlet weak var favorCount: UILabel!
    
    //@IBOutlet weak var replyButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favorButton: UIButton!
    //@IBOutlet weak var messageButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        profileImage.af_setImage(withURL: (tweet.user?.profile_image_url)!)
        usernameLabel.text = tweet.user?.name
        screenname.text = "@\(tweet.user!.screenName)"
        dateLabel.text = tweet.createdAtString!
        messageLabel.text = tweet.text
        
        
        navigationItem.title = usernameLabel.text
        
        
        if let count = tweet.favoriteCount{
            favorCount.text = "\(String(count)) FAVORITES"
        }
        else{
            favorCount.text = String(0)
        }
        
        if let count = tweet.retweetCount{
            retweetCount.text = "\(String(count)) RETWEENS"
        }
        else{
            retweetCount.text = String(0)
        }
    }
    
    
    @IBAction func didTapFavor(_ sender: Any) {
        if(!(tweet.favorited!)){
            let image = UIImage(named: "favor-icon-red")
            favorButton.setImage(image, for: UIControlState.normal)
            tweet.favorited = true
            
            APIManager.shared.favorite(tweet) { (ntweet: Tweet?, error: Error?) in
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
            tweet.favorited = false
            APIManager.shared.unfavorite(tweet) { (ntweet: Tweet?, error: Error?) in
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
    
    @IBAction func didTapRetweet(_ sender: Any) {
        if(!(tweet.retweeted!)){
            let image = UIImage(named: "retweet-icon-green")
            retweetButton.setImage(image, for: UIControlState.normal)
            
            tweet.retweeted = true
            APIManager.shared.retweet(tweet) { (ntweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error retweet tweet: \(error.localizedDescription)")
                } else if let ntweet = ntweet {
                    print("Successfully retweet the following Tweet")
                    let count = ntweet.retweetCount
                    self.retweetCount.text = String(count!)
                }
            }
        }else {
            let image = UIImage(named: "retweet-icon")
            retweetButton.setImage(image, for: UIControlState.normal)
            
            tweet.retweeted = false
            APIManager.shared.unretweet(tweet) { (ntweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error unretweet tweet: \(error.localizedDescription)")
                } else if let ntweet = ntweet {
                    print("Successfully unretweet the following Tweet")
                    let count = ntweet.retweetCount
                    self.retweetCount.text = String(count!)
                }
            }
        }
    }
    
}
