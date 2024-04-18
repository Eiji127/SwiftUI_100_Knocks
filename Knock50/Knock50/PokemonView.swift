//
//  PokemonView.swift
//  Knock50
//
//  Created by 白数叡司 on 2024/04/18.
//

import SwiftUI

struct PokemonView: View {
    
    let name: String
    
    var body: some View {
        Text("Name: \(name)")
    }
}

#Preview {
    PokemonView(name: "Snorlax")
}
