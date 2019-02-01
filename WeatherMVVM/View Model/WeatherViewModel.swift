//
//  WeatherViewModel.swift
//  WeatherMVVM
//
//  Created by michael.arianto on 2019/01/29.
//  Copyright © 2019 michael.arianto. All rights reserved.
//

import Foundation

struct WeatherViewModel {
	var city: String
	var temperature: Int
	init(data: Data) {
		let weatherData = try! JSONDecoder().decode(WeatherData.self, from: data)
		self.city = weatherData.city
		temperature = Int(weatherData.temperatureData.temperature.rounded())
	}
	
	
}



struct WeatherListViewModel {
	
	private var weatherViewModels: [WeatherViewModel] = []
	
	mutating func addModel(vm: WeatherViewModel){
		weatherViewModels.append(vm)
	}
	
	func count() -> Int {
		return weatherViewModels.count
	}
	
	func data(at index: Int) -> (String, String){
		return(weatherViewModels[index].city,String(weatherViewModels[index].temperature))
	}
	
	mutating func updateUnit (to unit: Unit) {
		switch unit {
		case .celcius:
			weatherViewModels = weatherViewModels.map { (weatherVM) in
				var newVm = weatherVM
				newVm.temperature = weatherVM.temperature.celcius()
				return newVm
			}
		case .fahrenheit:
			weatherViewModels = weatherViewModels.map { (weatherVM) in
				var newVm = weatherVM
				newVm.temperature = weatherVM.temperature.fahrenheit()
				return newVm
			}
		}
	}
}
