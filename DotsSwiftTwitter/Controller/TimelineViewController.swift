//
//  ViewController.swift
//  DotsSwiftTwitter
//
//  Created by 田中賢治 on 2017/02/11.
//  Copyright © 2017年 田中賢治. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var tweets: [Tweet]? = nil {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LoginCommunicator().login() { [weak self]loginError in
            if let loginError = loginError {
                self?.errorHandle(withLoginError: loginError)
                return
            }
            
            TwitterCommunicator().getTimeline() { [weak self] data, error in
                if let _ = error { return }
                
                if let data = data {
                    let tweetsParser = TweetsParser()
                    do {
                        self?.tweets = try tweetsParser.parse(json: data)
                    } catch let error {
                        print(error)
                    }
                }
            }
        }
    }

}

extension TimelineViewController {
    
    func errorHandle(withLoginError loginError: LoginError) {
        let alertController = UIAlertController(loginError: loginError)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
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
        return tweets?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineTableViewCell") as! TimelineTableViewCell
        
        cell.fill(with: tweets![indexPath.row])
        
        return cell
    }
    
}



