//
//  FeatureView.swift
//  ParkerPlaysv2
//
//  Created by Suzie on 1/24/23.
//

import UIKit

class FeatureView: UIView {
    let imageView = UIImageView()
    let checkImage = UIImage(systemName: "checkmark.circle")
    let label = UILabel()
    let boldAttribute = [
       NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 15.0)!
    ]
    let regularAttribute = [
       NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 15.0)!
    ]
    var boldText: String = ""
    var regText: String = ""
    
    func setupLabel(boldText: String, regText: String){
        addSubview(label)
        addSubview(imageView)
//        backgroundColor = .systemPink
        
        imageView.image = checkImage
        imageView.tintColor = .white
        label.textColor = .white
        label.numberOfLines = 0
        
        let boldText = NSAttributedString(string: boldText, attributes: boldAttribute)
        let regularText = NSAttributedString(string: regText, attributes: regularAttribute)
        let newString = NSMutableAttributedString()
        newString.append(boldText)
        newString.append(regularText)
        label.attributedText = newString
    
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        label.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        label.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 20).isActive = true
        label.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
    }
}
