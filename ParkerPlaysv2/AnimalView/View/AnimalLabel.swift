//
//  AnimalLabel.swift
//  ParkerPlaysv2
//
//  Created by Suzie  on 12/16/22.
//

import UIKit

class AnimalLabel: UILabel {
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        dropShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func dropShadow(){
        backgroundColor = .white
        clipsToBounds = true
        layer.cornerRadius = 15
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowRadius = 4
        
        //drop shadow is not showing up.. WHY 
    }
    
    
}
