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
        setupLabel()
 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabel(){
        font = UIFont.systemFont(ofSize: 50, weight: .medium)
        textAlignment = .center
        textColor = UIColor(red: 57/255, green: 57/255, blue: 57/255, alpha: 1)
     layer.cornerRadius = 15
        clipsToBounds = true
    }
    
    func dropShadow(){
        backgroundColor = .white
        layer.cornerRadius = 15
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowRadius = 4
        
        //drop shadow is not showing up > creat
    }
    
  
    
    
}
