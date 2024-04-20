//
//  ContentView.swift
//  Knock52
//
//  Created by 白数叡司 on 2024/04/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var showingPopUp: Bool = false
    
    var body: some View {
        ZStack {
            Button {
                showingPopUp = true
            } label: {
                Text("Tap Me!!")
                    .padding()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            
            if showingPopUp {
                PopUpView(isPresent: $showingPopUp)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(.gray)
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
