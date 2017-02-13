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
        do {
            let json = try JSONSerialization.jsonObject(
                with: json,
                options: .allowFragments
            )
            
            guard let jsonArray = json as? [Any] else { return [] }
            
            do {
                return try jsonArray.map { try Tweet(json: $0) }
            } catch JSONDecodeError.invalidFormat {
                print("invalidFormat")
            } catch JSONDecodeError.missingValue {
                print("missingValue")
            }
            
        } catch {
            print("failToSerialize")
            throw JSONSerializeError.failToSerialize
        }
        
        return []
    }
    
}
