//
//  ContentView.swift
//  Knock23
//
//  Created by 白数叡司 on 2024/02/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var people = ["Paul", "Talor", "Adele"]
    @State var editMode: EditMode = .inactive
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(people, id: \.self) { human in
                    Text(human)
                }
                .onDelete(perform: peopleRemove)
            }
            .navigationBarItems(
                trailing: editButton()
            )
            .environment(\.editMode, self.$editMode)
        }
    }
    
    func toggleEditMode() {
        if $editMode.wrappedValue.isEditing == true {
            $editMode.wrappedValue = .inactive
        } else {
            $editMode.wrappedValue = .active
        }
    }
    
    func peopleRemove(offsets: IndexSet) {
        people.remove(atOffsets: offsets)
    }
    
    @ViewBuilder
    func editButton() -> some View {
        Button(action: {
            toggleEditMode()
        }, label: {
            if $editMode.wrappedValue.isEditing == true {
                Text("Done")
            } else {
                Text("Edit")
            }
        })
    }
}

#Preview {
    ContentView()
}
