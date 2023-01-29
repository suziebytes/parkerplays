//
//  AnimalLabel.swift
//  ParkerPlaysv2
//
//  Created by Suzie  on 12/16/22.
//

import UIKit

class AnimalLabelView: UIView{
    let animalLabel = UILabel()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupLabelView()
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabelView(){
        backgroundColor = .white
        layer.cornerRadius = 15
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowRadius = 4
    }
    
    func setupLabel(){
        addSubview(animalLabel)
        animalLabel.font = UIFont.systemFont(ofSize: 50, weight: .regular)
        animalLabel.textAlignment = .center
        animalLabel.textColor = UIColor(red: 57/255, green: 57/255, blue: 57/255, alpha: 1)
        animalLabel.adjustsFontSizeToFitWidth = true
        
        //CONSTRAINTS
        animalLabel.translatesAutoresizingMaskIntoConstraints = false
        animalLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        animalLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        animalLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        animalLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    func updateLabelText(){
        let name = UserDefaults.standard.string(forKey: "faces-name") ?? ""
        animalLabel.text = name
    }  
}
