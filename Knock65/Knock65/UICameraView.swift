//
//  UICameraView.swift
//  Knock65
//
//  Created by 白数叡司 on 2024/06/03.
//

import AVFoundation
import SwiftUI

enum RecordingStatus: String {
    case ready
    case start
    case stop
}

public protocol CameraViewDelegate: AnyObject {
    func didFinishRecording(outputFileURL: URL)
}

public class UICameraView: UIView {
    private var videoDevice: AVCaptureDevice?
    private let fileOutput = AVCaptureMovieFileOutput()
    private var videoLayer: AVCaptureVideoPreviewLayer!
    public weak var delegate: CameraViewDelegate?
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        let captureSession: AVCaptureSession = AVCaptureSession()
        videoDevice = defaultCamera()
        let audioDevice: AVCaptureDevice? = AVCaptureDevice.default(for: AVMediaType.audio)
        
        // ビデオのインプット情報設定
        let videoInput: AVCaptureDeviceInput = try! AVCaptureDeviceInput(device: videoDevice!)
        captureSession.addInput(videoInput)
        
        // 撮影の上限設定
        fileOutput.maxRecordedDuration = CMTimeMake(value: 60, timescale: 1)
        
        captureSession.addOutput(fileOutput)
        
        // ビデオの画質設定
        captureSession.beginConfiguration()
        if captureSession.canSetSessionPreset(.hd4K3840x2160) {
            captureSession.sessionPreset = .hd4K3840x2160
        } else if captureSession.canSetSessionPreset(.high) {
            captureSession.sessionPreset = .high
        }
        captureSession.commitConfiguration()
        
        captureSession.startRunning()
        
        // ビデオのプレビューレイヤー
        videoLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoLayer.videoGravity = AVLayerVideoGravity.resizeAspect
        layer.addSublayer(videoLayer)
    }
    
    public override func layoutSubviews() {
        videoLayer.frame = bounds
    }
    
    /// 撮影を開始する。
    func startRecording() {
        let tempDirectory: URL = URL(fileURLWithPath: NSTemporaryDirectory())
        let fileURL: URL = tempDirectory.appendingPathComponent("mytemp1.mov")
        fileOutput.startRecording(to: fileURL, recordingDelegate: self)
    }
    
    /// 撮影を停止する。
    func stopRecording() {
        fileOutput.stopRecording()
    }
    
    private func defaultCamera() -> AVCaptureDevice? {
        if let device = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .front) {
            return device
        } else if let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) {
            return device
        } else {
            return nil
        }
    }
}

extension UICameraView: AVCaptureFileOutputRecordingDelegate {
    public func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: Error?) {
        delegate?.didFinishRecording(outputFileURL: outputFileURL)
    }
}
