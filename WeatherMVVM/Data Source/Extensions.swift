//
//  Extensions.swift
//  WeatherMVVM
//
//  Created by michael.arianto on 2019/02/01.
//  Copyright © 2019 michael.arianto. All rights reserved.
//

import Foundation

extension Int {
	 func celcius() -> Int {
		return (self-32)*5/9
	}
	
	 func fahrenheit() -> Int {
		return self * 5/9 + 32
	}
}
