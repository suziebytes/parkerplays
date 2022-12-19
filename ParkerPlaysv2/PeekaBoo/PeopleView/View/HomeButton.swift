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
        let image = UIImage(named: "houseicon.png")
        let normalImage = image?.withTintColor(.white)
        let hightlightImage = image?.withTintColor(UIColor(red: 79/255, green: 151/255, blue: 253/255, alpha: 1))

        setImage(normalImage, for:.normal)
        setImage(hightlightImage, for: .highlighted)
        
    }
    
}
