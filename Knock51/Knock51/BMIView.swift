//
//  BMIView.swift
//  Knock51
//
//  Created by 白数叡司 on 2024/04/19.
//

import SwiftUI

struct BMIView: View {
    
    var height: Int
    var weight: Int
    var bmi: Int = 0
    
    var body: some View {
        Text(String(bmi))
            .font(.system(size: 30))
            .onAppear {
//                bmi = weight/(height * height)
            }
    }
}

#Preview {
    BMIView(height: 170, weight: 58)
}
