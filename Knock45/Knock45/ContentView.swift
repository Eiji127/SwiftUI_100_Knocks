//
//  ContentView.swift
//  Knock45
//
//  Created by 白数叡司 on 2024/04/09.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("FAVORITE_POKEMON_NAME") var favoritePokemonName: String = ""
    
    var body: some View {
        VStack {
            Text("Your favorite pokemon is \(favoritePokemonName)")
                .padding()
            
            Button {
                favoritePokemonName = "Snorlax"
            } label: {
                Text("Snorlax is my favorite pokemon.")
            }
            .padding()
            
            Button {
                UserDefaults.standard.set("Slowpoke", forKey: "FAVORITE_POKEMON_NAME")
            } label: {
                Text("Slowpoke is my favorite pokemon.")
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
