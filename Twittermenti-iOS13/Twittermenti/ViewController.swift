//
//  ViewController.swift
//  Twittermenti
//
//  Created by Angela Yu on 17/07/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit
import SwifteriOS

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sentimentLabel: UILabel!
    
    let sentimentClassifier = TweetSentimentClassifer()
    let swifter = Swifter(consumerKey: "key", consumerSecret: "secret")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swifter.searchTweet(using: "@Apple", lang: "en", count: 100) { (result, metadata) in
            
            var tweets = [TweetSentimentClassiferInput]()
            
            for i in 0 ..< 100 {
                if let tweet = result[i]["full_text"].string {
                    let tweetForClassfication = TweetSentimentClassiferInput(text: tweet)
                    tweets.append(tweetForClassfication)
                }
            }
            
            do {
                let predictions = try self.sentimentClassifier.predictions(inputs: tweets)
                
                for pred in predictions {
                    print(pred.label)
                }
            } catch {
                print(error)
            }
            
        } failure: { error in
            print(error)
        }
        
        
        
    }
    
    @IBAction func predictPressed(_ sender: Any) {
        
        
    }
    
}

