//
//  FruitView.swift
//  Knock11
//
//  Created by 白数 叡司 on 2023/10/05.
//

import SwiftUI

struct FruitView: View {
    
    let fruit: String
    
    var body: some View {
        Text(fruit)
    }
}

struct FruitView_Previews: PreviewProvider {
    static var previews: some View {
        FruitView(fruit: "Apple")
    }
}
