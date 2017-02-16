//
//  ErrorExtension.swift
//  DotsSwiftTwitter
//
//  Created by Yutaro Muta on 2017/02/16.
//  Copyright © 2017年 田中賢治. All rights reserved.
//

import Foundation

extension Error {
  
  var typeMessage: String {
    return "\type of: \(type(of: self)), error: \(self)"
  }
  
}
