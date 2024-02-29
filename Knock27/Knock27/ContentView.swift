//
//  ContentView.swift
//  Knock27
//
//  Created by 白数叡司 on 2024/03/01.
//

import SwiftUI

struct ContentView: View {
    @State var values = [1 ,2, 3]
    
    var body: some View {
        HStack {
            Picker("AAA", selection: $values) {
                
            }
            Picker("AAA", selection: $values) {
                
            }
        }
    }
}

#Preview {
    ContentView()
}
