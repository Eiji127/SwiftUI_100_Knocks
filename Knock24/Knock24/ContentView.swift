//
//  ContentView.swift
//  Knock24
//
//  Created by 白数叡司 on 2024/02/28.
//

import SwiftUI

struct ContentView: View {
    @State var pokemons: [String] = ["Snorlax",
                                     "Pikachu",
                                     "Psyduck",
                                     "Blastoise",
                                     "Slowpoke"]
    @State var isAlertPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(pokemons, id: \.self) { pokemon in
                    Button(action: {
                        isAlertPresented = true
                    }, label: {
                        Text(pokemon)
                    })
                    .alert(Text("Alart"), isPresented: $isAlertPresented) {
                        Button("Close", role: .none) {
                            print("Tapped Close Button.")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
