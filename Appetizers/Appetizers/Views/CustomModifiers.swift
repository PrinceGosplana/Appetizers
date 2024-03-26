//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Oleksandr Isaiev on 26.03.2024.
//

import SwiftUI

struct StandartButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}

extension View {
    func standartButtonStyle() -> some View {
        self.modifier(StandartButtonStyle())
    }
}
