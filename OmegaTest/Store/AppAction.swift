//
//  AppAction.swift
//  OmegaTest
//
//  Created by Максим Казаков on 19.11.2019.
//  Copyright © 2019 Max Kazakov. All rights reserved.
//

import Foundation


enum AppAction {
	case successTransactionList([TransactionWidgetModel])
	case failureTransactionList(Error)
}
