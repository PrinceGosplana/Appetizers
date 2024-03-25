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
                    VStack {
                        Text("Calories")
                            .bold()
                            .font(.caption)
                        Text("\(appetizer.calories)")
                            .foregroundStyle(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }

                    VStack {
                        Text("Carbs")
                            .bold()
                            .font(.caption)
                        Text("\(appetizer.carbs)")
                            .foregroundStyle(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }

                    VStack {
                        Text("Protein")
                            .bold()
                            .font(.caption)
                        Text("\(appetizer.protein)")
                            .foregroundStyle(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                }
            }

            Spacer()

            Button {

            } label: {
                Text(appetizer.price.formatted( .currency(code: "USD").locale(Locale(identifier: "us-UA"))) + " - Add to Order")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 260, height: 50)
                    .foregroundStyle(.white)
                    .background(.braindPrimary)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
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
            ZStack {
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.white)
                    .opacity(0.6)

                Image(systemName: "xmark")
                    .imageScale(.small)
                    .frame(width: 44, height: 44)
                    .foregroundStyle(.black)
            }
        }
            , alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(false))
}
