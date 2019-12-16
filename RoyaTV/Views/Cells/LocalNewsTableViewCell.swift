//
//  LocalNewsTableViewCell.swift
//  RoyaTV
//
//  Created by Ali Shaker on 9/1/19.
//  Copyright © 2019 Ali Shaker. All rights reserved.
//

import UIKit

class LocalNewsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var localNewsImageView: UIImageView!
    @IBOutlet weak var localNewsTitleLabel: UILabel!
    @IBOutlet weak var localNewsSectionLabel: UILabel!
    @IBOutlet weak var localNewsAgeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
