//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Oleksandr Isaiev on 25.03.2024.
//

import SwiftUI

struct AppetizerDetailView: View {

    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool

    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)

            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)

                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()

                HStack(spacing: 40) {
                    NutritionInfo(title: "Calories", value: appetizer.calories)
                    NutritionInfo(title: "Carbs", value: appetizer.carbs)
                    NutritionInfo(title: "Protein", value: appetizer.protein)
                }
            }

            Spacer()

            Button {

            } label: {
                APButton(title: "\(appetizer.price.formatted( .currency(code: "USD").locale(Locale(identifier: "us-UA")))) - Add to Order")
            }
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 40)
        .overlay( 
            Button {
                isShowingDetail = false
        } label: {
            XDismissButton()
        }
            , alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(false))
}

struct NutritionInfo: View {

    let title: String
    let value: Int

    var body: some View {
        VStack {
            Text(title)
                .bold()
                .font(.caption)
            Text("\(value)")
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
