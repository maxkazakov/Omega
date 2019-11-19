//
//  ContentView.swift
//  OmegaTest
//
//  Created by Максим Казаков on 18.11.2019.
//  Copyright © 2019 Max Kazakov. All rights reserved.
//

import SwiftUI

struct TransactionsFeedView: View {
	
	init(models: [TransactionWidgetModel]) {
		self.models = models
		UITableView.appearance().separatorStyle = .none
	}
	
	var body: some View {
		List {
			ForEach(0..<models.count) { idx in
				self.makeCell(model: self.models[idx])
			}
		}		
	}
		
	
	// MARK: -Private
	private let models: [TransactionWidgetModel]
	
	
	private func makeCell(model: TransactionWidgetModel) -> some View {
		switch model {
		case .daySection(let daySection):
			return AnyView(DaySectionView(daySection: daySection))
		case .transaction(let transaction):
			return AnyView(TransactionView(transaction: transaction))
		}
	}
}

struct TransactionsFeedView_Previews: PreviewProvider {
	static var previews: some View {
		TransactionsFeedView(models: [
			.daySection(DaySection(date: "August, 9", amount: .init(value: "200.50", currencyCode: .gbp))),
			.transaction(.init(
				transaction: .init(
					type: .regular,
					title: "Bella Italia",
					amount: .init(value: "-200.50", currencyCode: .usd)
				), image: .init(iconName: "restaurant")
				)),
			.transaction(.init(
				transaction: .init(
					type: .cashback,
					title: "Hard Rock Cafe",
					amount: .init(value: "5.50", currencyCode: .gbp)
				), image: .init(iconName: "cashback")
				)),
		])
	}
}
