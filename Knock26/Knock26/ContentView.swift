//
//  ContentView.swift
//  Knock26
//
//  Created by 白数叡司 on 2024/02/28.
//

import SwiftUI

struct ContentView: View {
    @State var isPresented: Bool = false
    
    let pokemons: [Pokemon] = [Pokemon(id: 143, name: "Snorlax", type: .normal),
                               Pokemon(id: 25, name: "Pikachu", type: .electric),
                               Pokemon(id: 79, name: "Slowpoke", type: .water)]
    
    var body: some View {
        NavigationStack {
            List(pokemons) { pokemon in
                NavigationLink {
                    switch pokemon.type {
                    case .normal:
                        NormalView(pokemon: pokemon)
                    case .electric:
                        ElectricView(pokemon: pokemon)
                    case .water:
                        WaterView(pokemon: pokemon)
                    default:
                        Text("Ohter Type")
                    }
                } label: {
                    Text(pokemon.name)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
