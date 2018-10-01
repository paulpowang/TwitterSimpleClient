//
//  TimelineViewController.swift
//  twitter_alamofire_demo
//
//  Created by Aristotle on 2018-08-11.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController, UITableViewDataSource {
    
    var tweets: [Tweet] = []
    
    @IBOutlet weak var tableview: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as! TweetCell
        cell.tweetPost = tweets[indexPath.row]
        
        return cell
        
        
    }
    func fectchTweets(){
        
        APIManager.shared.getHomeTimeLine { (tweets: [Tweet]?, error: Error?) in
            if let tweets = tweets {
                self.tweets = tweets
                //self.tableView.reloadData()
                //self.refreshControl.endRefreshing()
                //self.activityindicator.stopAnimating()
            }else if let error = error{
                print(error.localizedDescription)
                //self.wifiAlarm()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.dataSource = self

        // Do any additional setup after loading the view.
        fectchTweets()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        APIManager.logout()
    }
    



}
