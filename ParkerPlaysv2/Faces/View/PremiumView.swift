//
//  PremiumView.swift
//  ParkerPlaysv2
//
//  Created by Suzie on 1/23/23.
//

import UIKit

class PremiumView: CardView {
    let logoView = UIImageView()
    let image = UIImage(named: "pplogo")
    let header = UILabel()
    let features = UITableView()
    
    func setupPremiumView(){
       backgroundColor = UIColor(red: 32/255, green: 11/255, blue: 48/255, alpha: 1)
        alpha = 0.85
    }
    
    func setupLogo(){
        addSubview(logoView)
        logoView.image = image
    
        logoView.translatesAutoresizingMaskIntoConstraints = false
        logoView.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        logoView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        logoView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        logoView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    func setupHeader(){
        addSubview(header)
        header.text = "PREMIUM ACCESS"
        header.textColor = .white

        header.translatesAutoresizingMaskIntoConstraints = false
        header.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 30).isActive = true
        header.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
    }
    
    func setupFeatureList(){
        
    }
    
}
