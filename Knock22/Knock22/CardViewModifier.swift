//
//  CardViewModifier.swift
//  Knock22
//
//  Created by 白数叡司 on 2024/02/25.
//

import SwiftUI

struct CardViewModifier: ViewModifier {
    let color: Color
    let radius: CGFloat
    func body(content: Content) -> some View {
        content
            .padding(16)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(color: color, radius: radius, x: 4, y: 4)
            .padding(radius + 8)
    }
}
