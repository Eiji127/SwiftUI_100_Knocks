//
//  ContentView.swift
//  Knock48
//
//  Created by 白数叡司 on 2024/04/14.
//

import SwiftUI

struct ContentView: View {
    @State var todoItems: [String] = []
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                List {
                    ForEach(todoItems, id: \.self) { user in
                        Text(user)
                    }
                    .onDelete(perform: delete)
                }
                
                NavigationLink(destination: InputView(delegate: self, text: "")) {
                    Text("Add")
                        .foregroundStyle(.white)
                        .font(.system(size: 20))
                }
                .frame(width: 60, height: 60)
                .background(.orange)
                .clipShape(Circle())
                .padding()
            }
        }
        .onAppear {
            if let todos = UserDefaults.standard.array(forKey: "TODO") as? [String] {
                self.todoItems = todos
            }
        }
        .navigationTitle("Todo")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                EditButton()
            }
        }
    }
    
    func delete(at offsets: IndexSet) {
        todoItems.remove(atOffsets: offsets)
        UserDefaults.standard.setValue(todoItems, forKey: "TODO")
    }
}

extension ContentView: InputViewDelegate {
    func addTodo(text: String) {
        todoItems.append(text)
        UserDefaults.standard.setValue(todoItems, forKey: "TODO")
    }
}

#Preview {
    ContentView()
}
