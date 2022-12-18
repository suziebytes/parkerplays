//
//  TextToSpeech.swift
//  ParkerPlaysv2
//
//  Created by Suzie  on 12/17/22.
//

import UIKit
import AVFoundation

struct TextToSpeech {
    let name: String = ""
    let synthesizer = AVSpeechSynthesizer()
    var player: AVAudioPlayer?
    
    func playTTS (sender: UIButton){

        let utterance = AVSpeechUtterance(string: name)
        utterance.rate = 0.1
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        synthesizer.speak(utterance)
    }
}
