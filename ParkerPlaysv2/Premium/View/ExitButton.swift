//
//  ExitButton.swift
//  ParkerPlaysv2
//
//  Created by Suzie on 1/24/23.
//

import UIKit

class ExitButton: UIButton {
    let exitView = UIImageView()
    let exitImage = UIImage(systemName: "xmark")
    
    func setupButton(){
        addSubview(exitView)
        exitView.image = exitImage
        exitView.tintColor = .white
        
        exitView.translatesAutoresizingMaskIntoConstraints = false
        exitView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        exitView.widthAnchor.constraint(equalToConstant: 25).isActive = true
    }
}
