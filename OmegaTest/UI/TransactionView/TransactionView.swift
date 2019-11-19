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
					.foregroundColor(fontColor)
			}
			Spacer()
			Text(money.money)
				.foregroundColor(fontColor)
		}
		.padding(15)		
		.background(
			isCashback
				? Color(Constants.cashbackBackgroundColor)
				: Color.white
		)
		.cornerRadius(16)
	}
	
	// MARK: -Private
	private enum Constants {
		static let cashbackBackgroundColor = #colorLiteral(red: 0.937254902, green: 0.9803921569, blue: 0.8980392157, alpha: 1)
		static let cashbackFontColor = #colorLiteral(red: 0.4745098039, green: 0.6196078431, blue: 0.3490196078, alpha: 1)
	}
	
	private var fontColor: Color {
		return isCashback ? Color(Constants.cashbackFontColor) : .black
	}
	
	private var money: Money {
		return transaction.transaction.amount.fragments.money
	}
	
	private var isCashback: Bool {
		return transaction.transaction.type == .cashback
	}
}

struct TransactionView_Previews: PreviewProvider {
	static var previews: some View {
		TransactionView(transaction: .init(
			transaction: .init(
				type: .regular,
				title: "Bella Italia",
				amount: .init(value: "5.50", currencyCode: .usd)
			),
			image: .init(iconName: "restaurant")
			)
		)
			.previewLayout(.sizeThatFits)
	}
}
