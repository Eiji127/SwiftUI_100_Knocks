//
//  ContentView.swift
//  Knock1
//
//  Created by 白数 叡司 on 2023/09/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image("Pikachu")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 200)
            .background(Color.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
