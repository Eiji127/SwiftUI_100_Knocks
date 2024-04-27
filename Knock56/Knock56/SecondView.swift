//
//  SecondView.swift
//  Knock56
//
//  Created by 白数叡司 on 2024/04/26.
//

import SwiftUI

struct SecondView: View {
    @Binding var isPresented: Bool

    var body: some View {
        NavigationStack {
            NavigationLink {
                ThirdView(showingSheet: $isPresented)
            } label: {
                Text("Go to Third View")
            }

        }
    }
}

#Preview {
    SecondView(isPresented: .constant(true))
}
