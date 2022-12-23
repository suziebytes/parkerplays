//
//  NumberList.swift
//  ParkerPlaysv2
//
//  Created by Suzie on 12/19/22.
//

import UIKit

class NumberButton: UIButton {
    var randNum = Int.random(in: 0..<3)
    
    func setupNumButton(){
        let colorList = [
            UIColor(red: 255/255, green: 85/255, blue: 54/255, alpha: 1),
            UIColor(red: 127/255, green: 17/255, blue: 224/255, alpha: 1),
            UIColor(red: 0/255, green: 143/255, blue: 255/255, alpha: 1),
            UIColor(red: 80/255, green: 227/255, blue: 194/255, alpha: 1)
        ]
        
        let color: UIColor = colorList[randNum]
        
        setTitleColor((color),for: .normal)
        titleLabel?.font = UIFont(name: "BaksoSapi", size: 300)
        
    }
}


