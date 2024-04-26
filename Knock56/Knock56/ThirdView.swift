//
//  ThirdView.swift
//  Knock56
//
//  Created by 白数叡司 on 2024/04/26.
//

import SwiftUI

struct ThirdView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            Text("Dimiss view")
        }
    }
}

#Preview {
    ThirdView()
}
