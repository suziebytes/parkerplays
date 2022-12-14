//
//  PlaySound.swift
//  ParkerPlaysv2
//
//  Created by Suzie  on 12/14/22.
//
import AVFoundation

struct PlaySound {
    var sound: AVAudioPlayer?
    var soundFile: String = ""
    
    mutating func playSound() {
        guard let url = Bundle.main.url(forResource: soundFile, withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            sound = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let sound = sound else { return }
            
            sound.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
