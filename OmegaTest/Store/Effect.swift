//
//  Effect.swift
//  OmegaTest
//
//  Created by Максим Казаков on 19.11.2019.
//  Copyright © 2019 Max Kazakov. All rights reserved.
//

import Foundation
import Combine


protocol Effect {
	associatedtype Action
	func mapToAction() -> AnyPublisher<Action, Never>
}


enum SideEffect: Effect {
	/// Загрузить список транзакций
	case loadTransactionsList
	
	func mapToAction() -> AnyPublisher<AppAction, Never> {
		switch self {
		case .loadTransactionsList:
			return transactionsService
				.loadAllTransactionWidgets()
				.map { AppAction.successTransactionList($0) }
				.catch { error in Just(AppAction.failureTransactionList(error)) }
				.eraseToAnyPublisher()
		}
	}
}
