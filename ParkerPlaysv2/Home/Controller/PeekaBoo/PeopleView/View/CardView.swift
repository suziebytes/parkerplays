//
//  CardView.swift
//  ParkerPlaysv2
//
//  Created by Suzie  on 12/16/22.
//

import UIKit

class CardView: UIView {
    let imageView = UIImageView()
    var image = ""

    override init(frame: CGRect) {
        super .init(frame: frame)
        setupCard()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   

    func setupCard(){
        backgroundColor = .white
        layer.cornerRadius = 15
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowRadius = 4
    }
    
    func setupImage(image: String){
        addSubview(imageView)
        imageView.image = UIImage(named: image)
        imageView.layer.cornerRadius = 15
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true

//        imageView.frame = self.frame instead of constraints(?)
        
        //CONSTRANTS
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
//    func animate() {
//        UIView.animate(withDuration: 1.0, delay: 0.0, options: [.transitionFlipFromRight], animations: {
//            self.cardView.isHidden = true
//        }, completion: nil)
//    }
//
    
    

    }
