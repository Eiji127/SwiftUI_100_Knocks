//
//  NormalView.swift
//  Knock26
//
//  Created by 白数叡司 on 2024/02/28.
//

import SwiftUI

struct NormalView: View {
    let pokemon: Pokemon
    var body: some View {
        Text(pokemon.name + " is Normal Type.")
    }
}
