//
//  Amout+Extension.swift
//  OmegaTest
//
//  Created by Максим Казаков on 19.11.2019.
//  Copyright © 2019 Max Kazakov. All rights reserved.
//

import Foundation


extension Money {
	var money: String {
		var value = self.value
		let sign: String
		if value.first == "-" {
			sign = String(value.removeFirst())
		} else {
			sign = "+"
		}
		return sign + currencyCode.symbol + value
	}
}
