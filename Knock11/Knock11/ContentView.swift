//
//  ContentView.swift
//  Knock11
//
//  Created by 白数 叡司 on 2023/10/05.
//

import SwiftUI

struct ContentView: View {
    
    let fruits: [String] = ["Apple",
                            "Banana",
                            "Orange",
                            "Grape",
                            "Cherry",
                            "Peach"]
    
    var body: some View {
        NavigationStack {
            List(fruits, id: \.self) { fruit in
                NavigationLink(destination: FruitView(fruit: fruit)){
                    Text(fruit)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
