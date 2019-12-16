//
//  PalestineTableViewCell.swift
//  RoyaTV
//
//  Created by Ali Shaker on 9/2/19.
//  Copyright © 2019 Ali Shaker. All rights reserved.
//

import UIKit

class PalestineTableViewCell: UITableViewCell {

    @IBOutlet weak var palestineImageView: UIImageView!
    @IBOutlet weak var palestineTitleLabel: UILabel!
    @IBOutlet weak var palestineSectionLabel: UILabel!
    @IBOutlet weak var palestineAgeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
