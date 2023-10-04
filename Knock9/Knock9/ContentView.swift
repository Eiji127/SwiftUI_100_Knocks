//
//  ContentView.swift
//  Knock9
//
//  Created by 白数 叡司 on 2023/10/03.
//

import SwiftUI

struct ContentView: View {
    
    @State private var text = "Snorlax"
    
    var body: some View {
        VStack {
            Text(text)
            
            Button {
                self.text = "Forever"
            } label: {
                Text("Tap Me")
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
