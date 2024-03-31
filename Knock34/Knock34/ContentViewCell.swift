//
//  ContentViewCell.swift
//  Knock34
//
//  Created by 白数叡司 on 2024/04/01.
//

import SwiftUI

struct ContentViewCell: View {
    let imageName: String
    
    var body: some View {
        Image("Pikachu")
            .resizable()
            .frame(width: 300, height: 300)
    }
}

#Preview {
    ContentViewCell(imageName: "Pikachu")
}
