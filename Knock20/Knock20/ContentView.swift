//
//  ContentView.swift
//  Knock20
//
//  Created by 白数叡司 on 2024/02/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("I")
                .font(.system(size: 20).bold())
            + Text(" ❤️ ")
                .foregroundStyle(Color.red)
            + Text("Snorlax")
                .foregroundStyle(Color.black)
                .font(.system(size: 20).bold())
            + Text("!\n")
            + Text("Snorlax ")
                .foregroundStyle(Color.red)
                .font(.system(size: 20).bold())
            + Text("is most ")
                .foregroundStyle(Color.blue)
                .font(.system(size: 20).bold())
            + Text("cute & cool & powerful ")
                .foregroundStyle(Color.green)
                .font(.system(size: 20).bold())
            + Text("Pokemon")
                .foregroundStyle(Color.yellow)
                .font(.system(size: 20).bold())
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
