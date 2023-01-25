//
//  BuyButton.swift
//  ParkerPlaysv2
//
//  Created by Suzie on 1/24/23.
//

import UIKit

class BuyButton: UIButton{
    
    func setupButton(){
        backgroundColor = UIColor(red: 183/255, green: 106/255, blue: 219/255, alpha: 1)
        layer.cornerRadius = 15
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowRadius = 4
    }
}
