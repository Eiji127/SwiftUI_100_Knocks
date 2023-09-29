//
//  ContentView.swift
//  Knock4
//
//  Created by 白数 叡司 on 2023/09/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image("Pikachu")
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(75)
            .overlay {
                Circle()
                    .stroke(Color.black, lineWidth: 5)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
