//
//  WeatherTableViewCell.swift
//  WeatherMVVM
//
//  Created by michael.arianto on 2019/01/29.
//  Copyright © 2019 michael.arianto. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

	@IBOutlet weak var cityLabel: UILabel!
	@IBOutlet weak var temperatureLabel: UILabel!
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
			
			
    }
	

}
