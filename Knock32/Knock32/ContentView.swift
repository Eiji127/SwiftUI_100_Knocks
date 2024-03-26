//
//  ContentView.swift
//  Knock32
//
//  Created by 白数叡司 on 2024/03/26.
//

import SwiftUI

struct ContentView: View {
    @State var message = "Shake me!"
    
    var body: some View {
        VStack {
            Text(message)
                .onReceive(NotificationCenter.default.publisher(for: .deviceDidShakeNotification), perform: { _ in
                    message = "Device Did Shake"
                })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

extension NSNotification.Name {
    public static let deviceDidShakeNotification = NSNotification.Name("DeviceDidShakeNotification")
}

extension UIWindow {
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        super.motionEnded(motion, with: event)
        NotificationCenter.default.post(name: .deviceDidShakeNotification, object: event)
    }
}
