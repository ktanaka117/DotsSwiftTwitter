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

//enum HttpError: Error {
//    case notModified(message: String)           // 304
//    case badRequest(message: String)            // 400
//    case Unauthorized(message: String)          // 401
//    case forbidden(message: String)             // 403
//    case notFound(message: String)              // 404
//    case notAcceptable(message: String)         // 406
//    case gone(message: String)                  // 410
//    case enhanceYourCalm(message: String)       // 420
//    case unprocessableEntity(message: String)   // 422
//    case tooManyRequests(message: String)       // 429
//    case internalServerError(message: String)   // 500
//    case badGateway(message: String)            // 502
//    case serviceUnavailable(message: String)    // 503
//    case gatewayTimeout(message: String)        // 504
//    
//    init?(json: [String: Any]) {
//        guard let message = json["message"] as? String else { return nil }
//        
//    }
//}


//{"errors":[{"message":"Sorry, that page does not exist","code":34}]}
