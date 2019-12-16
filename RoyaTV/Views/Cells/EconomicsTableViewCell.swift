//
//  EconomicsTableViewCell.swift
//  RoyaTV
//
//  Created by Ali Shaker on 9/2/19.
//  Copyright © 2019 Ali Shaker. All rights reserved.
//

import UIKit

class EconomicsTableViewCell: UITableViewCell {

    @IBOutlet weak var economicsImageView: UIImageView!
    @IBOutlet weak var economicsTitleLabel: UILabel!
    @IBOutlet weak var economicsSectionLabel: UILabel!
    @IBOutlet weak var economicsAgeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
