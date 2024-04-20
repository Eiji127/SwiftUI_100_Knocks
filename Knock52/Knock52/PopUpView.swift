//
//  PopUpView.swift
//  Knock52
//
//  Created by 白数叡司 on 2024/04/20.
//

import SwiftUI

struct PopUpView: View {
    @Binding var isPresent: Bool
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Pikachu")
                .font(.system(size: 18).bold())
            
            Image("Pikachu")
                .resizable()
                .frame(width: 80, height: 80)
            
            Text("Pikachu (Japanese: ピカチュウ Pikachu) is a electric-type Pokemon.")
                .font(.system(size: 18))
            
            Button {
                withAnimation {
                    isPresent = false
                }
            } label: {
                Text("Close")
            }
        }
        .frame(width: 200, alignment: .center)
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    PopUpView(isPresent: .constant(true))
}
