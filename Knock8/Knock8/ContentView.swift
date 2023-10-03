//
//  ContentView.swift
//  Knock8
//
//  Created by 白数 叡司 on 2023/10/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("First Tab")
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("First")
                }
            
            Text("Second Tab")
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Second")
                }
            
            Text("Third Tab")
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Third")
                }
            
        }
        .font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
