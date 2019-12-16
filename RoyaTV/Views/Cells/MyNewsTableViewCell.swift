//
//  MyNewsTableViewCell.swift
//  RoyaTV
//
//  Created by Ali Shaker on 9/1/19.
//  Copyright © 2019 Ali Shaker. All rights reserved.
//

import UIKit

class MyNewsTableViewCell: UITableViewCell {

    @IBOutlet weak var mynewsImageView: UIImageView!
    @IBOutlet weak var myNewsTitleLabel: UILabel!
    @IBOutlet weak var myNewsSectionLabel: UILabel!
    @IBOutlet weak var myNewsAgeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
