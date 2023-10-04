//
//  ContentView.swift
//  Knock10
//
//  Created by 白数叡司 on 2023/10/05.
//

import SwiftUI

struct ContentView: View {
    
    let normalPokemons = ["Snorlax", "Meowth", "Ditto"]
    let firePokemons = ["Vulpix", "Arcanine", "Charmander"]
    
    var body: some View {
        List {
            Section {
                ForEach(normalPokemons, id: \.self) { pokemon in
                    Text(pokemon)
                }
            } header: {
                Text("normal")
            }
            
            Section {
                ForEach(firePokemons, id: \.self) { pokemon in
                    Text(pokemon)
                }
            } header: {
                Text("fire")
            }
        }
    }
}

#Preview {
    ContentView()
}
