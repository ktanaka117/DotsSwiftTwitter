//
//  User.swift
//  FavLister
//
//  Created by 田中賢治 on 2016/02/09.
//  Copyright © 2016年 田中賢治. All rights reserved.
//

import Foundation

struct User: JSONDecodable {
    
    let id: String
    
    // (@)ktanaka117
    let screenName: String
    
    // ダンボー田中
    let name: String
    
    // プロフィール画像URL
    let profileImageURL: String
    
    init(json: Any) throws {
        guard let dictionary = json as? [String: Any] else {
            throw JSONDecodeError.invalidFormat(json: json)
        }
        
        guard let id = dictionary["id_str"] as? String else {
            throw JSONDecodeError.missingValue(key: "id_str", actualValue: dictionary["id_str"])
        }
        
        guard let screenName = dictionary["screen_name"] as? String else {
            throw JSONDecodeError.missingValue(key: "screen_name", actualValue: dictionary["screen_name"])
        }
        
        guard let name = dictionary["name"] as? String else {
            throw JSONDecodeError.missingValue(key: "name", actualValue: dictionary["name"])
        }
        
        guard let profileImageURL = dictionary["profile_image_url_https"] as? String else {
            throw JSONDecodeError.missingValue(key: "profile_image_url_https", actualValue: dictionary["profile_image_url_https"])
        }
        
        self.id = id
        self.screenName = screenName
        self.name = name
        self.profileImageURL = profileImageURL
    }
    
}
