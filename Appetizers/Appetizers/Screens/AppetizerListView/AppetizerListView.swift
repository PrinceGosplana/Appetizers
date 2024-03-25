//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Oleksandr Isaiev on 24.03.2024.
//

import SwiftUI

struct AppetizerListView: View {

    @StateObject var viewModel = AppetizerListViewModel()

    var body: some View {
        ZStack {
            NavigationStack {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            viewModel.selectedApperizer = appetizer
                            viewModel.isShowingDetail = true
                        }
                }
                .navigationTitle("🥩 Appetizers")
                .disabled(viewModel.isShowingDetail)
            }
            .onAppear {
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)

            if viewModel.isLoading {
                LoadingView()
            }

            if viewModel.isShowingDetail {
                AppetizerDetailView(appetizer: viewModel.selectedApperizer!, isShowingDetail: $viewModel.isShowingDetail)
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AppetizerListView()
}
