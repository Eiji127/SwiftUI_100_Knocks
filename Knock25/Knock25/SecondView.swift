//
//  SecondView.swift
//  Knock25
//
//  Created by 白数叡司 on 2024/02/28.
//

import SwiftUI

struct SecondView: View {
    var delegate: MyProtocol
    
    var body: some View {
        Button {
            delegate.hoge()
        } label: {
            Text("Tapped Delegate Method")
        }
    }
}
