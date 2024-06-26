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
    var filtredPokemons: [Pokemon] {
        if word.isEmpty {
            return pokemons
        } else {
            return pokemons.filter {
                $0.name.uppercased().contains(
                    word.uppercased()
                )
            }
        }
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                TextField("Type your search", text: $word)
                    .padding(8)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                ForEach(filtredPokemons, id: \.self) { pokemon in
                    VStack(alignment: .leading) {
                        Text(pokemon.name)
                            .padding(.leading, 12)
                        Divider()
                    }
                }
            }
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
