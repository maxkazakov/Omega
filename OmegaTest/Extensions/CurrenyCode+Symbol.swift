//
//  CurrenyCode+Symbol.swift
//  OmegaTest
//
//  Created by Максим Казаков on 19.11.2019.
//  Copyright © 2019 Max Kazakov. All rights reserved.
//

import Foundation


extension CurrencyCode {
	var symbol: String {
		switch self {
		case .gbp:
			return "£"
		case .rub:
			return "₽"
		case .usd:
			return "$"
		default:
			return ""
		}
	}
}
