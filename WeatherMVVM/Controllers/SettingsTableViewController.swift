//
//  SettingsTableViewController.swift
//  WeatherMVVM
//
//  Created by michael.arianto on 2019/01/30.
//  Copyright © 2019 michael.arianto. All rights reserved.
//

import UIKit

protocol SettingsDelegate {
	func didFinish()
}

class SettingsTableViewController: UITableViewController {
	
	var settingsVM: SettingsViewModel? {
		didSet {
			dataSource.viewModel = settingsVM
		}
	}
	
	var delegate: SettingsDelegate?
	
	var dataSource = SettingsTableViewDataSource()
	
	@IBAction func back(_ sender: UIBarButtonItem) {
		delegate?.didFinish()
		self.dismiss(animated: true, completion: nil)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.dataSource = dataSource
		navigationController?.navigationBar.prefersLargeTitles = true
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		switch indexPath.row {
		case 0:
			UserDefaults.standard.set(Unit.celcius.rawValue, forKey: "unit")
		case 1:
			UserDefaults.standard.set(Unit.fahrenheit.rawValue, forKey: "unit")
		default: return
		}
		tableView.reloadData()
	}
}


class SettingsTableViewDataSource: NSObject, UITableViewDataSource {
	
	var viewModel: SettingsViewModel?
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel?.units.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell") else {
			return UITableViewCell(style: .default, reuseIdentifier: nil)
		}
		
		cell.textLabel?.text = viewModel?.units[indexPath.row].displayName
		if UserDefaults.standard.object(forKey: "unit") as? String == viewModel?.units[indexPath.row].rawValue {
			cell.accessoryType = .checkmark
		} else {
			cell.accessoryType = .none
		}
		return cell
	}
	
}
