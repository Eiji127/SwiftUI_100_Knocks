//
//  ContentView.swift
//  Knock23
//
//  Created by 白数叡司 on 2024/02/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var people = ["Paul", "Talor", "Adele"]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(people, id: \.self) { human in
                    Text(human)
                }
                .onDelete(perform: delete)
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    EditButton()
                }
            }
        }
    }
    
    func delete(at offsets: IndexSet) {
        people.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
