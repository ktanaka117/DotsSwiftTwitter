//
//  ErrorAlertProtocol.swift
//  DotsSwiftTwitter
//
//  Created by Yutaro Muta on 2017/02/14.
//  Copyright © 2017 田中賢治. All rights reserved.
//

import UIKit

protocol ErrorAlertProtocol {}

extension ErrorAlertProtocol where Self: UIViewController {
    
    func presentAlert(for error: Error) {
        let alertController = UIAlertController(error: error)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
}
