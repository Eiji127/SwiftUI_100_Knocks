//
//  ShowMoreView.swift
//  Knock19
//
//  Created by 白数叡司 on 2024/02/21.
//

import SwiftUI

struct ShowMoreView: View {
    @State var text: String
    @State var isFirst = true
    @State var isFold = false
    @State var needFoldButton = true
    @State var textHeight: CGFloat?
    
    var body: some View {
        VStack(alignment: .trailing) {
            HStack {
                Text(text)
                    .frame(height: textHeight)
                    .background(GeometryReader(content: { geometry in
                        Color.clear.preference(key: SizePreference.self, value: geometry.size)
                    }))
                    .padding()
                    .onPreferenceChange(SizePreference.self, perform: { textSize in
                        if self.isFirst {
                            if textSize.height > 80 {
                                textHeight = 80
                                isFold = true
                                isFirst = false
                            } else {
                                needFoldButton = false
                            }
                        }
                    })
                Spacer()
            }
            
            if needFoldButton {
                Button {
                    self.isFold.toggle()
                    if isFold {
                        textHeight = 80
                    } else {
                        textHeight = nil
                    }
                } label: {
                    Text(isFold ? "More" : "Fold")
                }
                .padding(.trailing, 8)

            }
        }
    }
}

private struct SizePreference: PreferenceKey {
    static let defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}
