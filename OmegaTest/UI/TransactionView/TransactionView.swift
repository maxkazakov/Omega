//
//  TransactionView.swift
//  OmegaTest
//
//  Created by Максим Казаков on 19.11.2019.
//  Copyright © 2019 Max Kazakov. All rights reserved.
//

import SwiftUI

struct TransactionView: View {
	let transaction: Transaction
	
	var body: some View {
		HStack {
			HStack(alignment: .center, spacing: 16) {
				transaction.image?.iconName.map {
					Image($0)
					.resizable()
					.frame(width: 50.0, height: 50.0)
					.cornerRadius(20)
				}
				Text(transaction.transaction.title)
			}
			Spacer()
			Text(transaction.transaction.amount.value)
		}
		.padding([.top, .bottom, .leading], 15)
	}
}

struct TransactionView_Previews: PreviewProvider {
	static var previews: some View {
		TransactionView(transaction: .init(
			transaction: .init(
				type: .regular,
				title: "Bella Italia",
				amount: .init(value: "-5.50", currencyCode: .usd)
			),
			image: .init(iconName: "restaurant")
			)
		)
			.previewLayout(.sizeThatFits)
	}
}
