//
//  ContentView.swift
//  Knock34
//
//  Created by 白数叡司 on 2024/03/31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ContentViewCell(imageName: "Pikachu")
            ContentViewCell(imageName: "Pikachu")
            ContentViewCell(imageName: "Pikachu")
            ContentViewCell(imageName: "Pikachu")
            ContentViewCell(imageName: "Pikachu")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray)
        .tabViewStyle(.page)
        .menuIndicator(.visible)
    }
}

#Preview {
    ContentView()
}
