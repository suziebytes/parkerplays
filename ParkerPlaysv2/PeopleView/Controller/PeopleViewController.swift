//
//  PeopleViewController.swift
//  ParkerPlaysv2
//
//  Created by Suzie  on 12/16/22.
//

import UIKit

class PeopleViewController: UIViewController {
    let background = UIImageView(frame: UIScreen.main.bounds)
    let cardView = CardView()
    
    var image = String(Int.random(in: 0..<21))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupCardView()
        peopleImage()
    }
    
    func setupBackground(){
        view.addSubview(background)
        background.image = UIImage(named: "gradientbg")
        background.contentMode = .scaleAspectFill
        
        //CONSTRAINTS
        background.translatesAutoresizingMaskIntoConstraints = false
        background.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        background.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        background.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        background.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    func setupCardView(){
        view.addSubview(cardView)

        //CONSTRAINTS
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 530).isActive = true
        cardView.widthAnchor.constraint(equalToConstant: 315).isActive = true
    }
    
    func peopleImage(){
        cardView.setupImage(image: image)
    }
}


//UINavigationController that allows you to go back adn forth between two views
