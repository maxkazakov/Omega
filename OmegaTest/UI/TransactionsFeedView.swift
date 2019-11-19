//
//  ContentView.swift
//  OmegaTest
//
//  Created by Максим Казаков on 18.11.2019.
//  Copyright © 2019 Max Kazakov. All rights reserved.
//

import SwiftUI

struct TransactionsFeedView: View {
	@EnvironmentObject var store: Store<AppState, AppAction>
	
	init() {
		UITableView.appearance().separatorStyle = .none
	}
	
	var body: some View {
		makeMainView()
			.onAppear {
				self.store.send(SideEffect.loadTransactionsList)
		}
	}
	
	
	// MARK: -Private
	
	private func makeCell(model: TransactionWidgetModel) -> some View {
		switch model {
		case .daySection(let daySection):
			return AnyView(DaySectionView(daySection: daySection))
		case .transaction(let transaction):
			return AnyView(TransactionView(transaction: transaction))
		}
	}
	
	
	private func makeMainView() -> some View {
		switch store.state.transactionsListState {
		case .isLoading:
			return AnyView(ActivityIndicator(isAnimating: .constant(true), style: .large))
		case .list(let models):
			return AnyView(
				List(models) {
					self.makeCell(model: $0)
				}
			)
		case .error(_):
			// TODO: презентовать ошибку
			return AnyView(EmptyView())
		}
	}
	
}

struct TransactionsFeedView_Previews: PreviewProvider {
	static var previews: some View {
		TransactionsFeedView()
			.environmentObject(debugStore)
	}
}
