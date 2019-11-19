//
//  TransactionModel.swift
//  OmegaTest
//
//  Created by Максим Казаков on 18.11.2019.
//  Copyright © 2019 Max Kazakov. All rights reserved.
//

import Apollo


enum TransactionWidgetModel {
	case daySection(DaySection)
	case transaction(Transaction)
}


extension TransactionWidgetModel {
	init?(dailyTransaction: TransactionsFeedQuery.Data.DailyTransactionsFeed) {
		if let daySection = dailyTransaction.asDaySectionWidget {
			self = .daySection(daySection.fragments.daySection)			
		} else if let transaction = dailyTransaction.asTransactionWidget {
			self = .transaction(transaction.fragments.transaction)
		} else {
			return nil
		}
	}
}

extension TransactionWidgetModel: Identifiable {
	var id: String {
		switch self {
		case .daySection(let daySection):
			return daySection.date
		case .transaction(let transaction):
			return transaction.transaction.id
		}
	}
}

