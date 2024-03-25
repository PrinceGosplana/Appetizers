//
//  ContentView.swift
//  Appetizers
//
//  Created by Oleksandr Isaiev on 24.03.2024.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
        }
        .accentColor(.braindPrimary)
    }
}

#Preview {
    AppetizerTabView()
}
