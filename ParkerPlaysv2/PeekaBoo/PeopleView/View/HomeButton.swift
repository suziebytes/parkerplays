//
//  HomeButton.swift
//  ParkerPlaysv2
//
//  Created by Suzie  on 12/17/22.
//

import UIKit

class HomeButton: UIButton {
    let image = UIImage()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupHome()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupHome(){
        let image = UIImage(systemName: "house.circle.fill")

        //setting image color
        setImage(image, for:.normal)

        setImage(image, for: .highlighted)
        
        imageView?.tintColor = .white
        
        imageView?.translatesAutoresizingMaskIntoConstraints = false
        imageView?.heightAnchor.constraint(equalTo: widthAnchor).isActive = true
        imageView?.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    }
}
