//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Oleksandr Isaiev on 25.03.2024.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []

    func getAppetizers() {
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        }
    }
}
