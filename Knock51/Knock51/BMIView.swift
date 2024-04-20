//
//  BMIView.swift
//  Knock51
//
//  Created by 白数叡司 on 2024/04/19.
//

import SwiftUI

struct BMIView: View {
    
    @Binding var result: Double
    
    var body: some View {
        VStack {
            Text(String(result))
                .font(.system(size: 30))
            
            if result < 18.5 {
                Text("You are thin")
            } else if result > 25 {
                Text("You are fat")
            } else {
                Text("You are healthy")
            }
        }
    }
}
