//
//  BindingTextField.swift
//  WeatherMVVM
//
//  Created by michael.arianto on 2019/02/04.
//  Copyright © 2019 michael.arianto. All rights reserved.
//

import UIKit

class BindingTextField: UITextField {
	
	var textChangeClosure: (String) -> Void = { _ in }
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit()
	}
	
	func bind(callback: @escaping (String) -> Void) {
		self.textChangeClosure = callback
	}
	
	private func commonInit() {
		self.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
	}
	
	@objc func textFieldDidChange(_ textField: UITextField) {
		self.textChangeClosure(textField.text!)
	}
	
}
