//
//  SecondView.swift
//  Knock28
//
//  Created by 白数叡司 on 2024/03/21.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.white)
                .font(.system(size: 30))
        }
    }
}

#Preview {
    SecondView()
}
