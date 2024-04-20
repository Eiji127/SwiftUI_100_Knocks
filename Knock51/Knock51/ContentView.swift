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
    @State var bmi: Double = 0
    @State var showingSheet: Bool = false
    
    var body: some View {
        VStack(spacing: 16) {
            VStack(alignment: .leading) {
                Text("Height (cm)")
                TextField("Input Your Height", text: $height)
                    .keyboardType(.namePhonePad)
                    .padding()
                    .border(.black, width: 1)
            }
            .padding()
            
            VStack(alignment: .leading) {
                Text("Weight (kg)")
                TextField("Input Your Weight", text: $weight)
                    .keyboardType(.namePhonePad)
                    .padding()
                    .border(.black, width: 1)
            }
            .padding()
            
            Button {
                guard let height = Double(self.height),
                      let weight = Double(self.weight) else {
                    print("Fail to Calc BMI")
                    return
                }
                
                bmi = weight / (height / 100) / (height / 100)
                
                showingSheet = true
            } label: {
                Text("Calc BMI")
                    .font(.system(size: 30))
                    .foregroundStyle(.black)
                    .padding()
                    .background(Color(UIColor.lightGray))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            .sheet(isPresented: $showingSheet) {
                BMIView(result: $bmi)
            }
        }
    }
}

#Preview {
    ContentView()
}
