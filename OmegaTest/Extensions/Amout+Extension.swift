//
//  Amout+Extension.swift
//  OmegaTest
//
//  Created by Максим Казаков on 19.11.2019.
//  Copyright © 2019 Max Kazakov. All rights reserved.
//

import Foundation


extension Transaction.Transaction.Amount {
	private var money: String {
		var value = self.value
		var sign = ""
		if value.first == "-" {
			sign = String(value.removeFirst())
		}
		return sign + self.currencyCode.symbol + value
	}
}
