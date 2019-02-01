//
//  SettingsTableViewCell.swift
//  WeatherMVVM
//
//  Created by michael.arianto on 2019/01/30.
//  Copyright © 2019 michael.arianto. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
	@IBOutlet weak var tempMetrics: UILabel!
	@IBOutlet weak var checkIcon: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
