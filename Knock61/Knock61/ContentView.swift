//
//  ContentView.swift
//  Knock61
//
//  Created by 白数叡司 on 2024/05/08.
//

import SwiftUI

struct ContentView: View {
    let pokemons: [Pokemon] = [
        Pokemon(id: 25, name: "Pikachu"),
        Pokemon(id: 53, name: "Meowth"),
        Pokemon(id: 143, name: "Snowlax"),
        Pokemon(id: 79, name: "Slowpoke")
    ]
    
    @State var text: String = ""
    @FocusState var isTextFieldFocued: Bool
    var filtredPokemons: [Pokemon] {
        if text.isEmpty {
            return pokemons
        } else {
            return pokemons.filter {
                $0.name.uppercased().contains(
                    text.uppercased()
                )
            }
        }
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                TextField("Type your search", text: $text)
                    .padding(8)
                    .focused($isTextFieldFocued)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .showClearButton($text)
                ForEach(filtredPokemons, id: \.self) { pokemon in
                    VStack(alignment: .leading) {
                        Text(pokemon.name)
                            .padding(.leading, 12)
                        Divider()
                    }
                }
            }
        }
    }
}

struct TextFieldClearButton: ViewModifier {
    @Binding var text: String
    
    func body(content: Content) -> some View {
        content
            .overlay {
                if text != "" {
                    HStack {
                        Spacer()
                        Button {
                            text = ""
                        } label: {
                            Image(systemName: "delete.left")
                                .foregroundColor(.secondary)
                                .padding(.trailing, 4)
                        }
                        .padding()
                    }
                }
            }
    }
}

extension View {
    func showClearButton(_ text: Binding<String>) -> some View {
        self.modifier(TextFieldClearButton(text: text))
    }
}

struct Pokemon: Hashable {
    let id: Int
    let name: String
}

#Preview {
    ContentView()
}
