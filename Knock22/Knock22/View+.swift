//
//  View+.swift
//  Knock22
//
//  Created by 白数叡司 on 2024/02/25.
//

import SwiftUI

extension View {
    func card(
        color: Color = Color.gray.opacity(0.4),
        radius: CGFloat = 8
    ) -> some View {
        self.modifier(CardViewModifier(color: color, radius: radius))
    }
}
