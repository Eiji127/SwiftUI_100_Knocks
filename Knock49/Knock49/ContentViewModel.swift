//
//  ContentViewModel.swift
//  Knock49
//
//  Created by 白数叡司 on 2024/04/16.
//

import Foundation
import AVFoundation

class ContentViewModel: NSObject, ObservableObject, AVAudioPlayerDelegate {
    var audioPlayer: AVAudioPlayer?
    
    func playAudio() {
        guard let url = Bundle.main.url(forResource: "melody", withExtension: "mp3") else {
            return
        }
        audioPlayer = try! AVAudioPlayer(contentsOf: url)
        audioPlayer?.delegate = self
        audioPlayer?.play()
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("DEBUG: Did finish")
    }
}
