//
//  ContentView.swift
//  Knock57
//
//  Created by 白数叡司 on 2024/04/30.
//

import SwiftUI

struct ContentView: View {
    @State var pokemons = ["Pikachu", "Snorlax", "Meowth"]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(pokemons, id: \.self) { pokemon in
                    Text(pokemon)
                }
                .onMove { (indexSet, index) in
                    pokemons.move(fromOffsets: indexSet, toOffset: index)
                }
            }
            .navigationTitle("Pokemon List")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    EditButton()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
