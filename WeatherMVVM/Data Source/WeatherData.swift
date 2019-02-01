//
//  WeatherData.swift
//  WeatherMVVM
//
//  Created by michael.arianto on 2019/01/29.
//  Copyright © 2019 michael.arianto. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
	let city: String
	let temperatureData: temperatureData
	
	private enum CodingKeys: String, CodingKey {
		case temperatureData = "main"
		case city = "name"
	}
}

struct temperatureData: Decodable {
	let temperature: Double
	
	private enum CodingKeys: String, CodingKey {
		case temperature = "temp"
	}
}
