//
//  ContentView.swift
//  Knock7
//
//  Created by 白数 叡司 on 2023/10/03.
//

import SwiftUI

struct ContentView: View {
    var pokemons = ["Snorlax", "Pikachu", "Slowpoke", "Meowth"]
    @State private var selectedPokemon = 0
    
    var body: some View {
        Picker("Pokemon", selection: $selectedPokemon) {
            ForEach(0 ..< pokemons.count) {
                Text(self.pokemons[$0])
            }
        }.pickerStyle(WheelPickerStyle())
            .onReceive([self.selectedPokemon].publisher.first()) { value in
                print("selectedPokemon: \(value)")
                print(self.pokemons[value])
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
