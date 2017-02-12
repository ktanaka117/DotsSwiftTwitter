//
//  TweetParser.swift
//  DotsSwiftTwitter
//
//  Created by 田中賢治 on 2017/02/12.
//  Copyright © 2017年 田中賢治. All rights reserved.
//

import Foundation

struct TweetsParser {
    
    func parse(json: Data) throws -> [Tweet] {
        let jsonArray = try! JSONSerialization.jsonObject(
            with: json,
            options: .allowFragments
        ) as! [Any]
        
        return jsonArray.map { try! Tweet(json: $0) }
    }
    
}
