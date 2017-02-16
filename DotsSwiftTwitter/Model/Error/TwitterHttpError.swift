//
//  TwitterHttpError.swift
//  DotsSwiftTwitter
//
//  Created by Yutaro Muta on 2017/02/13.
//  Copyright © 2017 田中賢治. All rights reserved.
//

import UIKit

enum TwitterHttpError: Error {
    case notModified			// 304
    case badRequest				// 400
    case unauthorized			// 401
    case forbidden				// 403
    case notFound				// 404
    case notAcceptable			// 406
    case gone					// 410
    case enhanceYourCalm		// 420
    case unprocessableEntity	// 422
    case tooManyRequests		// 429
    case internalServerError	// 500
    case badGateway				// 502
    case serviceUnavailable		// 503
    case gatewayTimeout			// 504
    case other

    init?(statusCode: Int?) {
        guard let statusCode = statusCode else { return nil }
        switch statusCode {
        case 200...299: return nil
        case 304: self = .notFound
        case 400: self = .badRequest
        case 401: self = .unauthorized
        case 403: self = .forbidden
        case 404: self = .notFound
        case 406: self = .notAcceptable
        case 410: self = .gone
        case 420: self = .enhanceYourCalm
        case 422: self = .unprocessableEntity
        case 429: self = .tooManyRequests
        case 500: self = .internalServerError
        case 502: self = .badGateway
        case 503: self = .serviceUnavailable
        case 504: self = .gatewayTimeout
        default: self = .other
        }
    }
    
    var statusCode: Int {
        switch self {
        case .notModified: return 304
        case .badRequest: return 400
        case .unauthorized: return 401
        case .forbidden: return 403
        case .notFound: return 404
        case .notAcceptable: return 406
        case .gone: return 410
        case .enhanceYourCalm: return 420
        case .unprocessableEntity: return 422
        case .tooManyRequests: return 429
        case .internalServerError: return 500
        case .badGateway: return 502
        case .serviceUnavailable: return 503
        case .gatewayTimeout: return 504
        case .other: return 0
        }
    }
    
    var status: String {
        return HTTPURLResponse.localizedString(forStatusCode: self.statusCode)
    }
}
