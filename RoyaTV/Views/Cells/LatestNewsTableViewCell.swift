//
//  LatestNewsTableViewCell.swift
//  RoyaTV
//
//  Created by Ali Shaker on 9/1/19.
//  Copyright © 2019 Ali Shaker. All rights reserved.
//

import UIKit

class LatestNewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var latestNewsImageView: UIImageView!
    @IBOutlet weak var latestNewsTitleLabel: UILabel!
    @IBOutlet weak var latestNewsSectionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
