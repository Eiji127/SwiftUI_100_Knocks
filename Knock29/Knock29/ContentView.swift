//
//  ContentView.swift
//  Knock29
//
//  Created by 白数叡司 on 2024/03/21.
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
            SecondView()
        })
    }
}

#Preview {
    ContentView()
}
