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
	private func makeMainView() -> some View {
		switch store.state.transactionsListState {
		case .isLoading:
			return AnyView(ActivityIndicator(isAnimating: .constant(true), style: .large))
		case .list(let models):
			let sections = makeSectionsFromModels(models)
			return AnyView(
				List {
					ForEach(sections) { section in
						Section(
							header: DaySectionView(daySection: section.model)
								.background(Color.white)
								.listRowInsets(EdgeInsets()),
							footer: Spacer()
								.fixedSize(horizontal: false, vertical: true)
								.frame(width: nil, height: 12, alignment: .top)
								.background(Color(Constants.footerColor))
								.listRowInsets(EdgeInsets())
						) {
								ForEach(section.rows) { row in
									TransactionView(transaction: row)
								}
						}
					}
				})
		case .error(_):
			// TODO: презентовать ошибку
			return AnyView(EmptyView())
		}
	}
	
	
	private enum Constants {
		static let footerColor = #colorLiteral(red: 0.9607843137, green: 0.9764705882, blue: 0.9960784314, alpha: 1)
	}
	
	private func makeSectionsFromModels(_ models: [TransactionWidgetModel]) -> [TransactionSection] {
		var result = [TransactionSection]()
		var currentRows = [Transaction]()
		var currentSection: DaySection?
		models.forEach { model in
			switch model {
			case .daySection(let daySection):
				if let section = currentSection {
					result.append(TransactionSection(model: section, rows: currentRows))
					currentRows = []
				}
				currentSection = daySection
			case .transaction(let transaction):
				currentRows.append(transaction)
			}
		}
		return result
	}
	
	
	struct TransactionSection: Identifiable {
		var id: String {
			return model.date
		}
		let model: DaySection
		let rows: [Transaction]
	}
}

struct TransactionsFeedView_Previews: PreviewProvider {
	static var previews: some View {
		TransactionsFeedView()
			.environmentObject(debugStore)
	}
}
