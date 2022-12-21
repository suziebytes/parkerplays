//
//  NumberList.swift
//  ParkerPlaysv2
//
//  Created by Suzie on 12/19/22.
//

import UIKit

class NumberButton: UIButton {
    let TTS = TextToSpeech()
    var count = 0
    var randNum = Int.random(in: 0..<3)
    
    
    func setupNumButton(){
        let strCount = String(count)

        let colorList = [
            UIColor(red: 255/255, green: 85/255, blue: 54/255, alpha: 1),
            UIColor(red: 127/255, green: 17/255, blue: 224/255, alpha: 1),
            UIColor(red: 0/255, green: 143/255, blue: 255/255, alpha: 1),
            UIColor(red: 80/255, green: 227/255, blue: 194/255, alpha: 1)
        ]
        let color: UIColor = colorList[randNum]
        
        if count < 10 {
            count += 1 }
        else {
            count = 0
        }

        setTitleColor((color),for: .normal)
        titleLabel?.font = UIFont(name: "BaksoSapi", size: 300)
        setTitle(strCount, for: .normal )
    }
    
    func setupTTS (){
        let strCount = String(count)
        TTS.playTTS(name:strCount)

    }
    
    
}


