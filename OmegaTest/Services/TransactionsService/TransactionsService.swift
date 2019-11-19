//
//  TransactionsService.swift
//  OmegaTest
//
//  Created by Максим Казаков on 18.11.2019.
//  Copyright © 2019 Max Kazakov. All rights reserved.
//

import Combine

protocol TransactionsService {
	/// Загрузить всю ленту транзакций
	func loadAllTransactionWidgets() -> Future<[TransactionWidgetModel], Error>
}


class TransactionsServiceImpl: TransactionsService {
	
	func loadAllTransactionWidgets() -> Future<[TransactionWidgetModel], Error> {
		Future<[TransactionWidgetModel], Error> { promise in
			apollo.fetch(query: TransactionsFeedQuery()) { result in
				switch result {
				case .failure(let error):
					promise(.failure(error))
				case .success(let data):
					guard let feed = data.data?.dailyTransactionsFeed else {
						promise(.success([]))
						return
					}
					let models = feed.compactMap { feedItem in
						
						feedItem.flatMap { TransactionWidgetModel(dailyTransaction: $0) }
					}
					promise(.success(models))
				}
			}
		}
	}
	
}
