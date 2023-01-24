//
//  View.swift
//  ParkerPlaysv2
//
//  Created by Suzie on 1/11/23.
//

import UIKit

class NavigationButton: UIButton {
    
    func setupButton() {
        backgroundColor = UIColor(red: 79/255, green: 151/255, blue: 253/255, alpha: 1)
        layer.cornerRadius = 30
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowRadius = 4
    }
    
    
}
