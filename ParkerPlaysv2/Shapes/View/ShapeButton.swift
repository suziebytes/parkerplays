//
//  ShapeButton.swift
//  ParkerPlaysv2
//
//  Created by Suzie on 12/20/22.
//
//
import UIKit

class ShapeButton: UIButton {

    func setupButton(shape: String){
        
        setImage(UIImage(named: shape), for: .normal)
        contentMode = .scaleAspectFit
        
    }
}
