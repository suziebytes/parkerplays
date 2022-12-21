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
        let highlightedImage = image?.withTintColor(UIColor(red: 79/255, green: 151/255, blue: 253/255, alpha: 1))
        
        setImage(image, for: .normal)
        setImage(highlightedImage, for: .highlighted)
        contentMode = .scaleAspectFit
  
       
    }
}
