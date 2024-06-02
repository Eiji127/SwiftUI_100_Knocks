//
//  ContentView.swift
//  Knock65
//
//  Created by 白数叡司 on 2024/06/02.
//

import SwiftUI

struct ContentView: View {
    @State var recordingStatus: RecordingStatus = .ready
    var body: some View {
        VStack {
            CameraView(recordingStatus: $recordingStatus) { url in
                recordingStatus = .ready
                print(url)
            }
            .frame(width: 300, height: 400)
            
            Button {
                recordingStatus = .start
            } label: {
                Text("Start")
            }
            
            Button {
                recordingStatus = .stop
            } label: {
                Text("Stop")
            }
            Text("StartRecording: \(recordingStatus.rawValue)")
        }
    }
}

#Preview {
    ContentView()
}
