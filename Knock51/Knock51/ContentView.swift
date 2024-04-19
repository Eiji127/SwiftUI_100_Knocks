//
//  ContentView.swift
//  Knock51
//
//  Created by 白数叡司 on 2024/04/19.
//

import SwiftUI

struct ContentView: View {
    
    @State var height: String = ""
    @State var weight: String = ""
    @State var showingSheet: Bool = false
    
    var body: some View {
        VStack(spacing: 16) {
            TextField("Input Your Height", text: $height)
                .padding()
                .overlay {
                    
                }
            TextField("Input Your Weight", text: $weight)
                .padding()
                .overlay {
                    
                }
            Button {
                showingSheet = true
            } label: {
                Text("Calc BMI")
                    .font(.system(size: 30))
                    .foregroundStyle(.black)
            }
            .sheet(isPresented: $showingSheet) {
                BMIView(height: Int(height) ?? 0, weight: Int(weight) ?? 0)
            }
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .frame(width: 150, height: 50)
            .background(.gray)
        }
    }
}

#Preview {
    ContentView()
}
