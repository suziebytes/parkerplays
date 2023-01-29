//
//  PlayButton.swift
//  ParkerPlaysv2
//
//  Created by Suzie on 12/19/22.
//

import UIKit
import AVFoundation

class PlayTTSButton: UIButton {
    //move playButton in AnimalVC to be a reuable component
    let TTS = TextToSpeech()
    let text: String = ""
    
    func setupPlayButton(){
        setImage(UIImage(named: "playcircle.svg"), for: .normal)
        addTarget(self, action: #selector(toTTS), for: .touchUpInside)
    }
    
    @objc func toTTS(text: String) {
        print("play tapped")
        
        func TTS(name: String){
            
            let synthesizer = AVSpeechSynthesizer()
            
            func playTTS (name: String){
                
                let utterance = AVSpeechUtterance(string: name)
                utterance.rate = 0.5
                utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                synthesizer.speak(utterance)
            }
        }
    }
}
