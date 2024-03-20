//
//  ContentView.swift
//  Knock28
//
//  Created by 白数叡司 on 2024/03/18.
//

import SwiftUI

struct ContentView: View {
    @State var isSheetPresented: Bool = false
    
    var body: some View {
        VStack {
            Button {
                isSheetPresented = true
            } label: {
                Text("Tap me!")
            }
        }.sheet(isPresented: $isSheetPresented, content: {
            Text("Hello!!")
        })
    }
}

#Preview {
    ContentView()
}
