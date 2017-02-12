//
//  TimelineTableViewCell.swift
//  DotsSwiftTwitter
//
//  Created by 田中賢治 on 2017/02/12.
//  Copyright © 2017年 田中賢治. All rights reserved.
//

import UIKit

class TimelineTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        iconImageView.layer.cornerRadius = 8.0
    }
    
    func fill(with tweet: Tweet) {
        nameLabel.text = tweet.user.name
        screenNameLabel.text = tweet.user.screenName
        contentLabel.text = tweet.text
    }
    
}
