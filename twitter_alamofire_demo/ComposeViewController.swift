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

class ComposeViewController: UIViewController, UITextViewDelegate {
    
    //@IBOutlet weak var profileImage: UIImageView!
    //@IBOutlet weak var username: UILabel!
    //@IBOutlet weak var screenname: UILabel!
    
    @IBOutlet weak var tweetText: UITextView!
    @IBOutlet weak var textCount: UILabel!
    
    
    weak var delegate: ComposeViewControllerDelegate?
    
    var tweet: Tweet!
    var alertController = UIAlertController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tweetText.delegate = self
        tweetText.isEditable = true
        
        //profileImage.af_setImage(withURL: (User.current?.profile_image_url)!)
        //username.text = User.current?.name
        //screenname.text = "@\(User.current!.screenName)"
        
    }
    
    @IBAction func didTapPost(_ sender: Any) {
        APIManager.shared.composeTweet(with: tweetText.text!) { (tweet, error) in
            if let error = error {
                print("Error composing Tweet: \(error.localizedDescription)")
                
                // if fail tweet, Give user warning
                // There was a problem, check error.description
                self.alertController = UIAlertController(title: "Error", message: "\(String(describing: error.localizedDescription))", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Ok", style: .cancel) { (action) in
                    // handle cancel response here. Doing nothing will dismiss the view.
                }
                self.alertController.addAction(cancelAction)
                DispatchQueue.global().async(execute: {
                    DispatchQueue.main.sync{
                        self.present(self.alertController, animated: true, completion: nil)
                        
                    }
                })
                
            } else if let tweet = tweet {
                self.delegate?.did(post: tweet)
                print("Compose Tweet Success!")
                
                // if success tweet, go back to timeline vie
                self.alertController = UIAlertController(title: "Success", message: "Tweet Successfully Posted", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Ok", style: .cancel) { (action) in
                    
                    // handle cancel response here. Doing nothing will dismiss the view.
                    // Go back to home page.
                    let timeLineViewPage = self.storyboard?.instantiateViewController(withIdentifier: "TweetsTabBarController")
                    let appDelegate = UIApplication.shared.delegate
                    appDelegate?.window??.rootViewController = timeLineViewPage
                }
                self.alertController.addAction(cancelAction)
                DispatchQueue.global().async(execute: {
                    DispatchQueue.main.sync{
                        self.present(self.alertController, animated: true, completion: nil)
                        
                    }
                })
                
            }
        }
    }
    
    @IBAction func didTapCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // TODO: Check the proposed new text character count
        // Allow or disallow the new text
        
        // Set the max character limit
        let characterLimit = 140
        
        // Construct what the new text would be if we allowed the user's latest edit
        let newText = NSString(string: textView.text!).replacingCharacters(in: range, with: text)
        
        // TODO: Update Character Count Label
        textCount.text = String(characterLimit - newText.characters.count)
        // The new text should be allowed? True/False
        return newText.characters.count < characterLimit
    }

}
