//
//  WeatherListTableViewController.swift
//  WeatherMVVM
//
//  Created by michael.arianto on 2019/01/28.
//  Copyright © 2019 michael.arianto. All rights reserved.
//

import UIKit

class WeatherListTableViewController: UITableViewController {
	
	let dataSource = WeatherListTableDataSource()
	var settingsVM = SettingsViewModel()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.dataSource = dataSource
		self.navigationController?.navigationBar.prefersLargeTitles = true
		
	}
	
	func addWeatherDidSaved(vm: WeatherViewModel) {
		dataSource.weatherList.addModel(vm: vm)
		tableView.reloadData()
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "AddSegue" {
			let dest = (segue.destination as! UINavigationController).topViewController as! AddWeatherCityViewController
			dest.delegate = self
			dest.settingsVM = settingsVM
		} else if segue.identifier == "SettingsSegue" {
			let dest = (segue.destination as! UINavigationController).topViewController as! SettingsTableViewController
			dest.settingsVM = settingsVM
			dest.delegate = self
		}
	}
}


class WeatherListTableDataSource: NSObject, UITableViewDataSource {
	
	var weatherList = WeatherListViewModel()

	
	 func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	
	 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return weatherList.count()
	}
	
	 func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 50
	}
	
	 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherTableViewCell
		let data = weatherList.data(at: indexPath.row)
		cell.cityLabel.text = data.0
		cell.temperatureLabel.text = data.1
		return cell
	}
	
}

extension WeatherListTableViewController: SettingsDelegate {
	func didFinish() {
		guard let unitName = UserDefaults.standard.object(forKey: "unit") as? String else {
			return
		}
		dataSource.weatherList.updateUnit(to: Unit(rawValue: unitName)!)
		tableView.reloadData()
	}
}
