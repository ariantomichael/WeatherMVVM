//
//  WebServices.swift
//  WeatherMVVM
//
//  Created by michael.arianto on 2019/01/29.
//  Copyright © 2019 michael.arianto. All rights reserved.
//

import Foundation

struct Resource {
	let url: URL
	let parse: (Data) -> WeatherViewModel?
}

final class Webservice {
	
	func load(resource: Resource, completion: @escaping (WeatherViewModel?) -> Void) {
		
		URLSession.shared.dataTask(with: resource.url) { (data, response, error) in
			if let data = data {
				print(data)
				DispatchQueue.main.async {
					completion(resource.parse(data))
				}
			} else {
				completion(nil)
			}
		}.resume()
	}
	
}
