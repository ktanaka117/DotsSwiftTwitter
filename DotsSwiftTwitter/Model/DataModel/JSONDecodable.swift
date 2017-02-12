//
//  JSONDecodable.swift
//  DotsSwiftTwitter
//
//  Created by 田中賢治 on 2017/02/12.
//  Copyright © 2017年 田中賢治. All rights reserved.
//

import Foundation

protocol JSONDecodable {
    init(json: Any) throws
}
