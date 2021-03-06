//
//  JSONDecodeError.swift
//  DotsSwiftTwitter
//
//  Created by 田中賢治 on 2017/02/13.
//  Copyright © 2017年 田中賢治. All rights reserved.
//

import Foundation

enum JSONDecodeError: Error {
    case invalidFormat(json: Any)
    case missingValue(key: String, actualValue: Any?)
}
