//
//  ViewController.swift
//  DotsSwiftTwitter
//
//  Created by 田中賢治 on 2017/02/11.
//  Copyright © 2017年 田中賢治. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController, ErrorAlertProtocol {

    @IBOutlet weak var tableView: UITableView!
    
    var tweets: [Tweet] = [] 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LoginCommunicator().login() { [weak self] loginError in
            if let loginError = loginError {
                self?.presentAlert(for: loginError)
                return
            }
            
            TwitterCommunicator().getTimeline() { [weak self] data, error in
                if let error = error {
                    self?.presentAlert(for: error)
                    return
                }
                
                if let data = data {
                    let tweetsParser = TweetsParser()
                    do {
                        self?.tweets = try tweetsParser.parse(json: data)
                        
                        DispatchQueue.main.async { _ in
                            self?.tableView.reloadData()
                        }
                    } catch let error {
                        print(error)
                    }
                }
            }
        }
    }

}

extension TimelineViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}

extension TimelineViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineTableViewCell") as! TimelineTableViewCell
        
        cell.fill(with: tweets[indexPath.row])
        
        return cell
    }
    
}



