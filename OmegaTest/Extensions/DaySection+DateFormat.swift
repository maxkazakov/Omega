//
//  Transaction+DateFormat.swift
//  OmegaTest
//
//  Created by Максим Казаков on 19.11.2019.
//  Copyright © 2019 Max Kazakov. All rights reserved.
//

import Foundation


fileprivate let inputDateFormatter: DateFormatter = {
	let formatter = DateFormatter()
	formatter.dateFormat = "yyyy-MM-dd"
	return formatter
}()


fileprivate let outputDateFormatter: DateFormatter = {
	let formatter = DateFormatter()
	formatter.dateStyle = .medium
	formatter.timeStyle = .none
	return formatter
}()


extension DaySection {
	var formattedDate: String {
		guard let date = inputDateFormatter.date(from: date) else {
			return ""
		}
		return outputDateFormatter.string(from: date)
	}
}
