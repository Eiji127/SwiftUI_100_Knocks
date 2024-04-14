//
//  InputView.swift
//  Knock48
//
//  Created by 白数叡司 on 2024/04/14.
//

import SwiftUI

protocol InputViewDelegate {
    func addTodo(text: String)
}

struct InputView: View {
    @Environment(\.dismiss) var dismiss
    let delegate: InputViewDelegate
    @State var text: String
    
    var body: some View {
        VStack(spacing: 16) {
            TextField("Input Your TODO", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Add") {
                delegate.addTodo(text: text)
                dismiss()
            }
        }
        .padding()
    }
}
