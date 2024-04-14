//
//  ContentView.swift
//  Knock48
//
//  Created by 白数叡司 on 2024/04/14.
//

import SwiftUI

struct ContentView: View {
//    @AppStorage("TODO_ITEMS") var todoItems: [TodoItem] = []
    
    var body: some View {
        NavigationStack {
            
        }
    }
}

#Preview {
    ContentView()
}

struct TodoItem {
    var id: Int
    var name: String
    var description: String
}
