//
//  OrderView.swift
//  Appetizers
//
//  Created by Oleksandr Isaiev on 24.03.2024.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(PlainListStyle())
                    
                    if !order.items.isEmpty {
                        Button {

                        } label: {
//                            APButton(title: "\(order.totalPrice.formatted( .currency(code: "USD").locale(Locale(identifier: "us-UA")))) - Place Order")
                            Text("\(order.totalPrice.formatted( .currency(code: "USD").locale(Locale(identifier: "us-UA")))) - Place Order")
                        }
                        .modifier(StandartButtonStyle())
                        .padding(.bottom, 25)
                    }
                }

                if order.items.isEmpty {
                    ContentUnavailableView("You have no items in your order.\nPlease add an appetizer.", systemImage: "list.bullet.clipboard")
                        .offset(y: -50)
                }
            }
            .navigationTitle("🍿 Orders")
        }
    }
}

#Preview {
    OrderView()
}
