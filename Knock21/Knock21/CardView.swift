//
//  CardView.swift
//  Knock21
//
//  Created by 白数叡司 on 2024/02/21.
//

import SwiftUI

struct CardView<Content>: View where Content: View {
    let color: Color
    let radius: CGFloat
    let content: () -> Content
    
    init(color: Color = Color.gray.opacity(0.4),
         radius: CGFloat = 8,
         @ViewBuilder content: @escaping () -> Content) {
        self.color = color
        self.radius = radius
        self.content = content
    }
    
    var body: some View {
        content()
            .padding(16)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(color: color, radius: radius, x: 4, y: 4)
            .padding(radius + 8)
    }
}
