//
//  ContentView.swift
//  Knock26
//
//  Created by 白数叡司 on 2024/02/28.
//

import SwiftUI

struct ContentView: View {
    @State var isPresented: Bool = false
    @State var pokemon: String = ""
    
    let pokemons: [String] = ["Snorlax", "Pikachu", "Slowpoke"]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(pokemons, id: \.self) { pokemon in
                    Button {
                        self.pokemon = pokemon
                        isPresented = true
                    } label: {
                        Text(pokemon)
                    }
                }
            }
            .navigationDestination(isPresented: $isPresented) {
                if pokemon == "Snorlax" {
                    SecondView(pokemon: pokemon)
                }
                if pokemon == "Pikachu" {
                    ThirdView(pokemon: pokemon)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
