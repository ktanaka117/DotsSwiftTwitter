//
//  UIAlertControllerExtension.swift
//  DotsSwiftTwitter
//
//  Created by Yutaro Muta on 2017/02/13.
//  Copyright © 2017 田中賢治. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    convenience init(loginError: LoginError) {
        let message: String
        switch loginError {
        case .twitterNotAvailable:
            message = "Twitterが利用できません"
        case .notGranted:
            message = "アカウントを許可してください"
        case .other(let error):
            message = (error as NSError).localizedDescription
        }
        
        self.init(title: "ログインに失敗しました", message: message, preferredStyle: .alert)

    }
    
    convenience init(twitterHttpError: TwitterHttpError) {
        self.init(title: twitterHttpError.message, message: "", preferredStyle: .alert)
    }

}
