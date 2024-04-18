//
//  ContentView.swift
//  Knock50
//
//  Created by 白数叡司 on 2024/04/18.
//

import SwiftUI

struct ContentView: View {

    @State var name: String = ""
    @State var showingSheet: Bool = false
    
    var body: some View {
        VStack(spacing: 16) {
            TextField("Input Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Text("Name: \(name)")
            
            Button {
                showingSheet = true
            } label: {
                Text("Show Modal")
                    .font(Font.system(size: 20))
                    .foregroundStyle(.white)
                    .padding(16)
                    .background(.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                
            }
        }
        .sheet(isPresented: $showingSheet) {
            PokemonView(name: name)
        }
    }
}

#Preview {
    ContentView()
}
