//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by Oleksandr Isaiev on 24.03.2024.
//

import SwiftUI

struct AppetizerListCell: View {

    let appetizer: Appetizer

    var body: some View {
        HStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(8)
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text(appetizer.price.formatted( .currency(code: "USD").locale(Locale(identifier: "us-UA"))))
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizer)
}
