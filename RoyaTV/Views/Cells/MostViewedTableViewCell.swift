//
//  MostViewedTableViewCell.swift
//  RoyaTV
//
//  Created by Ali Shaker on 9/1/19.
//  Copyright © 2019 Ali Shaker. All rights reserved.
//

import UIKit

class MostViewedTableViewCell: UITableViewCell {

    @IBOutlet weak var mostViewedImageView: UIImageView!
    @IBOutlet weak var mostViewedTitleLabel: UILabel!
    @IBOutlet weak var mostViewedSectionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
