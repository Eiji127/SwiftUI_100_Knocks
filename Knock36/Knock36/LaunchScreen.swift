//
//  LaunchScreen.swift
//  Knock36
//
//  Created by 白数叡司 on 2024/04/03.
//

import SwiftUI

struct LaunchScreen: View {
    @State var viewType: ViewType = .launch
    
    var body: some View {
        ZStack {
            switch viewType {
            case .home:
                Text("Home")
            case .launch:
                Image("Pikachu")
                    .resizable()
                    .frame(width: 200, height: 200)
            }
        }
        .onAppear {
            Task {
                try? await Task.sleep(nanoseconds: UInt64(3 * 1_000_000_000))
                withAnimation(.linear(duration: 0.5)) {
                    viewType = .home
                }
            }
        }
    }
}

#Preview {
    LaunchScreen()
}

enum ViewType {
    case launch
    case home
}
