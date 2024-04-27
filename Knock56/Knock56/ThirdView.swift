//
//  ThirdView.swift
//  Knock56
//
//  Created by 白数叡司 on 2024/04/26.
//

import SwiftUI

struct ThirdView: View {
    @Binding var showingSheet: Bool
    
    var body: some View {
        Button {
            showingSheet = false
        } label: {
            Text("Dimiss view")
        }
    }
}

#Preview {
    ThirdView(showingSheet: .constant(false))
}
