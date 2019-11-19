//
//  AppState.swift
//  OmegaTest
//
//  Created by Максим Казаков on 19.11.2019.
//  Copyright © 2019 Max Kazakov. All rights reserved.
//

import Foundation


struct AppState {
	
	var transactionsListState: TransactionsListState
	
	enum TransactionsListState {
		case isLoading
		case list([TransactionWidgetModel])
		case error(Error)
		
		var list: [TransactionWidgetModel] {
			switch self {
			case .list(let list):
				return list
			default:
				
				return []
			}
		}
	}
	
	
	static let `default` = AppState(transactionsListState: .isLoading)
}


let debugState: AppState = AppState(transactionsListState: .list(
	[
		.daySection(DaySection(date: "August, 9", amount: .init(value: "200.50", currencyCode: .gbp))),		
		.transaction(.init(
			transaction: .init(
				id: "1",
				type: .regular,
				title: "Bella Italia",
				amount: .init(value: "-200.50", currencyCode: .usd)
			), image: .init(iconName: "restaurant")
			)),
		.transaction(.init(
			transaction: .init(
				id: "2",
				type: .cashback,
				title: "Hard Rock Cafe",
				amount: .init(value: "5.50", currencyCode: .gbp)
			), image: .init(iconName: "cashback")
			)),
	]
))


