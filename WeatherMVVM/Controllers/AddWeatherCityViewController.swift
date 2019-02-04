//
//  AddWeatherCityViewController.swift
//  WeatherMVVM
//
//  Created by michael.arianto on 2019/01/28.
//  Copyright © 2019 michael.arianto. All rights reserved.
//

import UIKit

class AddWeatherCityViewController: UIViewController {

	private var addCityViewModel = AddCityViewModel()
	
	@IBOutlet weak var zipTextField: BindingTextField! {
		didSet {
			zipTextField.bind {
				self.addCityViewModel.zipCode = $0
			}
		}
	}
	@IBOutlet weak var stateTextField: BindingTextField! {
		didSet {
			stateTextField.bind {
				self.addCityViewModel.state = $0
			}
		}
	}
	@IBOutlet weak var cityTextField: BindingTextField! {
		didSet {
			cityTextField.bind {
				self.addCityViewModel.city = $0
			}
		}
	}
	var delegate: WeatherListTableViewController?
	var settingsVM: SettingsViewModel?
	
	override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
	@IBAction func save(_ sender: UIButton) {
		print(self.addCityViewModel)
		guard let city = cityTextField.text else {
			return
		}
		let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=8a5f32a71b144e1c1962f37d4b28297e&units=metric")
		let resource = Resource(url: url!) { data in
			
			let vm = WeatherViewModel(data: data)
			return vm
		}
		Webservice().load(resource: resource) { [weak self] weatherVM in
			guard let weatherVM = weatherVM else {
				return
			}
			self?.delegate?.addWeatherDidSaved(vm: weatherVM)
			self?.dismiss(animated: true, completion: nil)
		}
	}
	
	@IBAction func backToMain(_ sender: UIBarButtonItem) {
		self.dismiss(animated: true, completion: nil)
	}
}
