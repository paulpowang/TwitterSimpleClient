//
//  ComposeViewController.swift
//  twitter_alamofire_demo
//
//  Created by paul on 10/7/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

protocol ComposeViewControllerDelegate: NSObjectProtocol {
    func did(post: Tweet)
}

class ComposeViewController:UIViewController,UITextViewDelegate{
    
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var screenname: UILabel!
    @IBOutlet weak var tweetMessage: UITextView!
    
    @IBOutlet weak var characterCount: UILabel!
    var delegate: ComposeViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetMessage.delegate = self
        // Do any additional setup after loading the view.
        
        APIManager.shared.getCurrentAccount{(user:User?, error: Error?) in
            if let user = user {
                self.username.text = user.name
                self.screenname.text = "@\(user.screenName)"
                
                self.profileImage.af_setImage(withURL: user.profile_image_url)
                
                
            }
        }
 
        
    }
    
    
    @IBAction func tapTweet(_ sender: Any) {
        if let text = tweetMessage.text{
            APIManager.shared.composeTweet(with: text) { (tweet, error) in
                if let error = error {
                    print("Error composing Tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    self.delegate?.did(post: tweet)
                    print("Compose Tweet Success!")
                    
                }
                
            }
        }
        
        let TimelineViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TimelineViewController") as! TimelineViewController
        self.navigationController?.pushViewController(TimelineViewController, animated: true)
    }
    
    //word count
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let characterLimit = 140
        let newText = NSString(string: textView.text!).replacingCharacters(in: range, with: text)
        let textcnt = (characterLimit - newText.count)
        characterCount.text = String(textcnt)
        return newText.count < characterLimit
    }
    
    
}
