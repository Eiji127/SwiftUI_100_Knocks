//
//  CameraView.swift
//  Knock65
//
//  Created by 白数叡司 on 2024/06/02.
//

import SwiftUI

struct CameraView: UIViewRepresentable {
    @Binding var recordingStatus: RecordingStatus
    let didFinishRecording: (_ outputFileURL: URL) -> Void
    
    final public class Coordinator: NSObject, CameraViewDelegate {
        private var cameraView: CameraView
        let didFinishRecording: (_ outputFileURL: URL) -> Void
        init(_ cameraView: CameraView, didFinishRecording: @escaping (_: URL) -> Void) {
            self.cameraView = cameraView
            self.didFinishRecording = didFinishRecording
        }
        
        public func didFinishRecording(outputFileURL: URL) {
            didFinishRecording(outputFileURL)
        }
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(self, didFinishRecording: didFinishRecording)
    }
    
    func makeUIView(context: Context) -> UICameraView {
        let uiCameraVideo = UICameraView()
        uiCameraVideo.delegate = context.coordinator
        return uiCameraVideo
    }
    
    func updateUIView(_ uiView: UICameraView, context: Context) {
        switch recordingStatus {
        case .ready:
            return
        case .start:
            uiView.startRecording()
        case .stop:
            uiView.stopRecording()
        }
    }
}
