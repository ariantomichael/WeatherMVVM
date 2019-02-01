//
//  SettingsViewModel.swift
//  WeatherMVVM
//
//  Created by michael.arianto on 2019/01/30.
//  Copyright © 2019 michael.arianto. All rights reserved.
//

import Foundation

enum Unit: String, CaseIterable {
	case celcius = "metric"
	case fahrenheit = "imperial"

	var displayName: String {
		switch self {
		case .celcius:
			return "Celcius"
		case .fahrenheit:
			return "Fahrenheit"
		}
	}
	
}

struct SettingsViewModel {
	
	let units = Unit.allCases
}
