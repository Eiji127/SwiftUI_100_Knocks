//
//  SecondView.swift
//  Knock56
//
//  Created by 白数叡司 on 2024/04/26.
//

import SwiftUI

struct SecondView: View {
    @State var isPresented: Bool = false

    var body: some View {
        NavigationStack {
            Button {
                isPresented = true
            } label: {
                Text("Show Third View.")
            }
            .navigationDestination(isPresented: $isPresented) {
                ThirdView()
            }
        }
    }
}

#Preview {
    SecondView()
}
