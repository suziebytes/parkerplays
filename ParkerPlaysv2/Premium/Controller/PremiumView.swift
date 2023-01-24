//
//  PremiumView.swift
//  ParkerPlaysv2
//
//  Created by Suzie on 1/23/23.
//

import UIKit

class PremiumViewController: UIViewController {
  
    let background = UIImageView(frame: UIScreen.main.bounds)
    let card = CardView()
    let logoView = UIImageView()
    let image = UIImage(named: "pplogo")
    let header = UILabel()
    let featOne = UILabel()
    let featTwo = UILabel()
    let featThree = UILabel()
    let featFour = UILabel()
    let horizontalLine = UIView()
    let boldAttribute = [
       NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 15.0)!
    ]
    let regularAttribute = [
       NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 15.0)!
    ]
   
    
    override func viewDidLoad() {
        setupBackground()
        setupCard()
        setupLogo()
        setupHeader()
        setupLine()
        setupLabelOne()
    }
    func setupBackground(){
        view.addSubview(background)
        background.image = UIImage(named: "gradientbg")
    }
    
    func setupCard(){
        view.addSubview(card)
        card.backgroundColor = UIColor(red: 32/255, green: 11/255, blue: 48/255, alpha: 0.65)

        card.translatesAutoresizingMaskIntoConstraints = false
        card.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        card.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.65).isActive = true
        card.widthAnchor.constraint(equalToConstant: 315).isActive = true
        card.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func setupLogo(){
        card.addSubview(logoView)
        logoView.image = image
    
        logoView.translatesAutoresizingMaskIntoConstraints = false
        logoView.topAnchor.constraint(equalTo: card.topAnchor, constant: 40).isActive = true
        logoView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        logoView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        logoView.centerXAnchor.constraint(equalTo: card.centerXAnchor).isActive = true
    }
    
    func setupHeader(){
        card.addSubview(header)
        header.text = "PREMIUM ACCESS"
        header.textColor = .white

        header.translatesAutoresizingMaskIntoConstraints = false
        header.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 25).isActive = true
        header.leftAnchor.constraint(equalTo: card.leftAnchor, constant: 30).isActive = true
    }
    
    func setupLine(){
        card.addSubview(horizontalLine)
        horizontalLine.backgroundColor = .white
        
        horizontalLine.translatesAutoresizingMaskIntoConstraints = false
        horizontalLine.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 5).isActive = true
        horizontalLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        horizontalLine.widthAnchor.constraint(equalToConstant: 315).isActive = true
        horizontalLine.rightAnchor.constraint(equalTo: card.rightAnchor, constant: -15).isActive = true
        horizontalLine.leftAnchor.constraint(equalTo: card.leftAnchor, constant: 15).isActive = true
    }
    
    func setupLabelOne(){
        card.addSubview(featOne)
        
        let boldText = NSAttributedString(string: "FEELINGS", attributes: boldAttribute)
        let regularText = NSAttributedString(string: " includes animations to enhance emotional development", attributes: regularAttribute)
        let newString = NSMutableAttributedString()
        newString.append(boldText)
        newString.append(regularText)
        featOne.attributedText = newString
        featOne.textColor = .white
        //wraps the text
        featOne.numberOfLines = 0
    
        featOne.translatesAutoresizingMaskIntoConstraints = false
        featOne.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 30).isActive = true
        featOne.widthAnchor.constraint(equalTo: card.widthAnchor).isActive = true
        featOne.leftAnchor.constraint(equalTo: card.leftAnchor, constant: 15).isActive = true
        featOne.rightAnchor.constraint(equalTo: card.rightAnchor, constant: -15).isActive = true
    }
    
    func setupLabelTwo(){
        
    }
    
}
