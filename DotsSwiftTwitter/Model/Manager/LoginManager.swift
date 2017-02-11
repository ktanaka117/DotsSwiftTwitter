//
//  LoginManager.swift
//  DotsSwiftTwitter
//
//  Created by 田中賢治 on 2017/02/11.
//  Copyright © 2017年 田中賢治. All rights reserved.
//

import Social
import Accounts

struct LoginManager {
    
    func login(completion: @escaping () -> ()) throws {
        
        if !SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) {
            throw LoginError.twitterNotAvailable
        }
        
        let store = ACAccountStore()
        let type = store.accountType(withAccountTypeIdentifier: ACAccountTypeIdentifierTwitter)
        
        store.requestAccessToAccounts(with: type, options: nil) { granted, error in
            
            // 承認されなかった場合
            if !granted {
//                throw LoginError.notGranted
                return
            }
            
            // 何らかのエラーがあった場合
            if let error = error {
//                LoginError.other(error)
                return
            }
            
            let accounts = store.accounts(with: type)
            // FIXME: アカウント選択させよう
            if let account = accounts?.first as? ACAccount {
                Account.twitterAccount = account
                completion()
            }
        }
        
    }
    
}
