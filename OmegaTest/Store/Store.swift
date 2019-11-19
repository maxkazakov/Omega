//
//  Store.swift
//  OmegaTest
//
//  Created by Максим Казаков on 19.11.2019.
//  Copyright © 2019 Max Kazakov. All rights reserved.
//

import Combine
import Foundation

final class Store<State, Action>: ObservableObject {
	@Published private(set) var state: State
	
	private let reducer: Reducer<State, Action>
	private var cancellables: Set<AnyCancellable> = []
	
	init(initialState: State, reducer: Reducer<State, Action>) {
		self.state = initialState
		self.reducer = reducer
	}
	
	func send(_ action: Action) {
		reducer.reduce(&state, action)
	}
	
	
	func send<E: Effect>(_ effect: E) where E.Action == Action {
		effect
			.mapToAction()
			.receive(on: DispatchQueue.main)
			.sink(receiveValue: send)
			.store(in: &cancellables)
	}
}


let debugStore = Store(
	initialState: debugState,
	reducer: appReducer
)
