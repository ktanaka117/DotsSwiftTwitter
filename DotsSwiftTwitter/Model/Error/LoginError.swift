//
//  LoginError.swift
//  DotsSwiftTwitter
//
//  Created by 田中賢治 on 2017/02/13.
//  Copyright © 2017年 田中賢治. All rights reserved.
//

import Foundation

enum LoginError: Error {
    case twitterNotAvailable
    case notGranted
    case other(Error)
}
