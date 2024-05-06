//
//  ContentView.swift
//  Knock60
//
//  Created by 白数叡司 on 2024/05/06.
//

import SwiftUI

struct ContentView: View {
    let pokemons: [Pokemon] = [
        Pokemon(id: 25, name: "Pikachu"),
        Pokemon(id: 53, name: "Meowth"),
        Pokemon(id: 143, name: "Snowlax"),
        Pokemon(id: 79, name: "Slowpoke")
    ]
    
    @State var word: String = ""
    
    var body: some View {
        NavigationStack {
            List(pokemons, id: \.self) { pokemon in
                if word == "" {
                    Text(pokemon.name)
                } else if pokemon.name.lowercased().contains(word) {
                    Text(pokemon.name)
                }
            }
            .searchable(text: $word,
                        placement: .navigationBarDrawer,
                        prompt: "Type your search")
        }
    }
}

struct Pokemon: Hashable {
    let id: Int
    let name: String
}

#Preview {
    ContentView()
}
