//
//  Pokemon.swift
//  Knock26
//
//  Created by 白数叡司 on 2024/02/28.
//

struct Pokemon: Identifiable {
    var id: Int
    let name: String
    let type: PokemonType
}

enum PokemonType {
    case fire
    case water
    case electric
    case normal
}
