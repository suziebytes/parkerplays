//
//  HelloView.swift
//  ParkerPlaysv2
//
//  Created by Suzie  on 12/13/22.
//

import UIKit
 
class HelloView: UIView {
    let helloLabel = UILabel()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupHello()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupHello(){
  
        addSubview(helloLabel)
        helloLabel.text = "Hello"
        helloLabel.textColor = .white
        helloLabel.font = UIFont.systemFont(ofSize: 50, weight: .light)
    
        
        //CONSTRAINTS
        helloLabel.translatesAutoresizingMaskIntoConstraints = false
        helloLabel.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        helloLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50).isActive = true
        //centers text
        helloLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
      
    }
    
}
