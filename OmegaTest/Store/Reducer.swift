//
//  Reducer.swift
//  OmegaTest
//
//  Created by Максим Казаков on 19.11.2019.
//  Copyright © 2019 Max Kazakov. All rights reserved.
//

import Foundation


struct Reducer<State, Action> {
	let reduce: (inout State, Action) -> Void
}

let appReducer: Reducer<AppState, AppAction> = Reducer { state, action in
	switch action {
	case .successTransactionList(let list):
		state.transactionsListState = .list(list)
		
	case .failureTransactionList(let error):
		state.transactionsListState = .error(error)
	}
}
