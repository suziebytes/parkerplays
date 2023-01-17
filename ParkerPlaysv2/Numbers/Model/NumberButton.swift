//
//  NumberList.swift
//  ParkerPlaysv2
//
//  Created by Suzie on 12/19/22.
//

import UIKit

class NumberButton: UIButton {
    let colorList = [
        UIColor(red: 62/255, green: 166/255, blue: 217/255, alpha: 1),
        UIColor(red: 47/255, green: 191/255, blue: 185/255, alpha: 1),
        UIColor(red: 179/255, green: 195/255, blue: 32/255, alpha: 1),
        UIColor(red: 254/255, green: 205/255, blue: 43/255, alpha: 1),
        UIColor(red: 249/255, green: 163/255, blue: 35/255, alpha: 1),
        UIColor(red: 220/255, green: 163/255, blue: 35/255, alpha: 1),
        UIColor(red: 239/255, green: 101/255, blue: 123/255, alpha: 1),
        UIColor(red: 164/255, green: 99/255, blue: 218/255, alpha: 1)
    ]
    
    func setupNumButton(colorCount: Int){
        let color: UIColor = colorList[colorCount]
        setTitleColor((color),for: .normal)
        titleLabel?.font = UIFont(name: "Lemonella", size: 250)
    }
}


