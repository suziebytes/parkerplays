//
//  WeatherView.swift
//  ParkerPlaysv2
//
//  Created by Suzie  on 12/13/22.
//

import UIKit

class WeatherView: UIView {
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupImage(){
        addSubview(imageView)
        imageView.image = UIImage(named: "Cloud2")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        //CONSTRAINTS
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}
