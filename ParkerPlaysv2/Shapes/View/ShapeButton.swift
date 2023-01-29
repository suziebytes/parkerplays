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
        let image = UIImage(named: shape)
        
        setImage(image, for: .normal)
        setImage(image, for: .highlighted)
    }
}
