//
//  UIAlertControllerExtension.swift
//  DotsSwiftTwitter
//
//  Created by Yutaro Muta on 2017/02/13.
//  Copyright © 2017 田中賢治. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    convenience init(error: Error) {
        switch error {
        case let loginError as LoginError:
            self.init(loginError: loginError)
        case let twitterHttpError as TwitterHttpError:
            self.init(twitterHttpError: twitterHttpError)
        default:
            self.init(title: "Undefined Error", message: error.typeMessage, preferredStyle: .alert)
        }
    }
    
    private convenience init(loginError: LoginError) {
        let title: String
        switch loginError {
        case .twitterNotAvailable:
            title = "Twitterが利用できません"
        case .notGranted:
            title = "アカウントを許可してください"
        case .other(let error):
            title = (error as NSError).localizedDescription
        }

        self.init(title: title, message: loginError.typeMessage, preferredStyle: .alert)

    }
    
    private convenience init(twitterHttpError: TwitterHttpError) {
        self.init(title: twitterHttpError.status, message: twitterHttpError.typeMessage, preferredStyle: .alert)
    }
    
}
