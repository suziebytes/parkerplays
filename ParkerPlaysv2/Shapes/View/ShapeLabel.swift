//
//  ShapeLabel.swift
//  ParkerPlaysv2
//
//  Created by Suzie on 12/23/22.
//

import UIKit

class ShapeLabel: UIView {
    let shapeLabel = UILabel()
    
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
        addSubview(shapeLabel)
        shapeLabel.font = UIFont.systemFont(ofSize: 50, weight: .regular)
        shapeLabel.textAlignment = .center
        shapeLabel.textColor = UIColor(red: 57/255, green: 57/255, blue: 57/255, alpha: 1)
        shapeLabel.adjustsFontSizeToFitWidth = true
        
        //CONSTRAINTS
        shapeLabel.translatesAutoresizingMaskIntoConstraints = false
        shapeLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        shapeLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        shapeLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        shapeLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}
