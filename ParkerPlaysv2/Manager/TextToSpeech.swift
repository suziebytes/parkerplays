//
//  TextToSpeech.swift
//  ParkerPlaysv2
//
//  Created by Suzie  on 12/17/22.
//

import UIKit
import AVFoundation

struct TextToSpeech {
    let synthesizer = AVSpeechSynthesizer()
    var player: AVAudioPlayer?
    
    func playTTS (name: String){

        let utterance = AVSpeechUtterance(string: name)
        utterance.rate = 0.5
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        synthesizer.speak(utterance)
    }
}
