//
//  Tweet.swift
//  FavLister
//
//  Created by 田中賢治 on 2016/02/09.
//  Copyright © 2016年 田中賢治. All rights reserved.
//

import Foundation

struct Tweet: JSONDecodable {
    
    let id: String
    let text: String
    let user: User
    
    init(json: Any) throws {
        guard let dictionary = json as? [String: Any] else {
            throw JSONDecodeError.invalidFormat(json: json)
        }
        
        guard let id = dictionary["id_str"] as? String else {
            throw JSONDecodeError.missingValue(key: "id_str", actualValue: dictionary["id_str"])
        }
        
        guard let text = dictionary["text"] as? String else {
            throw JSONDecodeError.missingValue(key: "text", actualValue: dictionary["text"])
        }
        
        guard let user = dictionary["user"] else {
            throw JSONDecodeError.missingValue(key: "user", actualValue: dictionary["user"])
        }
        
        self.id = id
        self.text = text
        self.user = try User(json: user)
    }
    
}
