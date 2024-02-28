//
//  ContentView.swift
//  Knock24
//
//  Created by 白数叡司 on 2024/02/28.
//

import SwiftUI

struct ContentView: View {
    let pokemons: [Pokemon] = [Pokemon(id: 143, name: "Snorlax"),
                               Pokemon(id: 25, name: "Pikachu"),
                               Pokemon(id: 138, name: "Psyduck"),
                               Pokemon(id: 9, name: "Blastoise"),
                               Pokemon(id: 79, name: "Slowpoke")]
    @State var isAlertPresented: Bool = false
    @State var pokemon: Pokemon?
    
    var body: some View {
        List(pokemons) { pokemon in
            Button {
                self.pokemon = pokemon
                isAlertPresented = true
            } label: {
                Text(pokemon.name)
            }
        }
        .alert(Text("Alert"), isPresented: $isAlertPresented, presenting: pokemon) { pokemon in
            Button(pokemon.name, role: .none) {
                print("Close")
            }
        } message: { pokemon in
            Text(pokemon.name)
        }
    }
}

#Preview {
    ContentView()
}
