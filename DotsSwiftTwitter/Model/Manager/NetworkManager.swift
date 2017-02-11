//
//  NetworkManager.swift
//  DotsSwiftTwitter
//
//  Created by 田中賢治 on 2017/02/11.
//  Copyright © 2017年 田中賢治. All rights reserved.
//

import Social

struct NetworkManager {
    
    func getTimeline() {
        let request = SLRequest(
            forServiceType: SLServiceTypeTwitter,
            requestMethod: .GET,
            url: URL(string: "https://api.twitter.com/1.1/statuses/home_timeline.json"),
            parameters: nil
        )
        
        request?.account = Account.twitterAccount
        
        request?.perform { data, response, error in
            if error != nil {
                print("Error")
            } else {
                let json = try! JSONSerialization.jsonObject(
                    with: data!,
                    options: .allowFragments
                )
                print(json)
            }
        }
    }
    
}
