//
//  File.swift
//  ParkerPlaysv2
//
//  Created by Suzie on 1/5/23.
//

import UIKit

class OppositeButton: UIButton {
    
    func setupButton() {
        backgroundColor = .white
        layer.cornerRadius = 15
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowRadius = 4
    }
}
