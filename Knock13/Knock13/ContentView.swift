//
//  ContentView.swift
//  Knock13
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
                Text("Normal")
            }
            
            Section {
                ForEach(firePokemons, id: \.self) { pokemon in
                    Text(pokemon)
                }
            } header: {
                Text("Fire")
            }
        }
        .listStyle(.plain)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
