//
//  LaunchScreen.swift
//  Knock36
//
//  Created by 白数叡司 on 2024/04/03.
//

import SwiftUI

struct LaunchScreen: View {
    @State var isPreseted: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("Pikachu")
                    .resizable()
                    .frame(width: 200, height: 200)
            }
            .onAppear {
                Task {
                    try? await Task.sleep(nanoseconds: UInt64(1 * 1_000_000_000))
                    isPreseted = true
                }
            }
            .navigationDestination(isPresented: $isPreseted) {
                Text("Second View")
            }
        }
    }
}

#Preview {
    LaunchScreen()
}
