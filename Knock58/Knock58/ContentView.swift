//
//  ContentView.swift
//  Knock58
//
//  Created by 白数叡司 on 2024/05/02.
//

import SwiftUI

struct ContentView: View {
    let pokemons: [Pokemon] = [
        Pokemon(id: 25, name: "Pikachu"),
        Pokemon(id: 53, name: "Meowth"),
        Pokemon(id: 143, name: "Snowlax")
    ]
    
    var body: some View {
        List {
            ForEach(pokemons, id: \.self) { pokemon in
                HStack {
                    Text(pokemon.name)
                    Spacer()
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    print(pokemon)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct Pokemon: Hashable {
    let id: Int
    let name: String
}
