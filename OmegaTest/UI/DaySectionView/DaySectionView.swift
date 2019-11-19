//
//  DaySectionView.swift
//  OmegaTest
//
//  Created by Максим Казаков on 19.11.2019.
//  Copyright © 2019 Max Kazakov. All rights reserved.
//

import SwiftUI

struct DaySectionView: View {
	let daySection: DaySection
	
	var body: some View {
		HStack {
			Text(daySection.date)
				.foregroundColor(.secondary)
			Spacer()
			Text("123")
				.bold()
		}
		.padding([.top, .bottom], 15)
	}
}

struct DaySectionView_Previews: PreviewProvider {
	static var previews: some View {
		DaySectionView(daySection: DaySection(date: "August, 9", amount: .init(value: "+200.50", currencyCode: .gbp)))
			.previewLayout(.sizeThatFits)
	}
}
