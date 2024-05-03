//
//  ContentView.swift
//  Knock59
//
//  Created by 白数叡司 on 2024/05/04.
//

import SwiftUI

struct ContentView: View {
    let pokemons: [Pokemon] = [
        Pokemon(id: 25, name: "Pikachu"),
        Pokemon(id: 53, name: "Meowth"),
        Pokemon(id: 143, name: "Snowlax")
    ]
    
    var body: some View {
        List(pokemons, id: \.self) { pokemon in
            
            HStack {
                Text(pokemon.name)
                
                Spacer()
                
                Button {
                    print("DEBUG: Tapped Left Button")
                } label: {
                    Text("Left")
                        .padding()
                }
                .border(.green)
                
                Button {
                    print("DEBUG: Tapped Right Button")
                } label: {
                    Text("Right")
                        .padding()
                }
                .border(.green)
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
