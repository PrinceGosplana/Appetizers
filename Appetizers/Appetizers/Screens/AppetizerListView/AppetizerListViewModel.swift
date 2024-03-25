//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Oleksandr Isaiev on 25.03.2024.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {

    @Published var alertItem: AlertItem?
    @Published var appetizers: [Appetizer] = []
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedApperizer: Appetizer?

    func getAppetizers() {
        isLoading = true

        NetworkManager.shared.getAppetizers { [self] result in
            DispatchQueue.main.async {

                self.isLoading = false

                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    switch error {
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}