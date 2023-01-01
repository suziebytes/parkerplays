//
//  ColorsViewController.swift
//  ParkerPlaysv2
//
//  Created by Suzie on 12/25/22.
//

import UIKit

class ColorsViewController: UIViewController {
    
    let label = AnimalLabelView()
    let cardView = CardView()
    let homeButton = HomeButton()
    var sound = PlaySound()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        setupHomeButton()
        setupCardView()
        setupLabel()
    }
     
    func setupHomeButton(){
        view.addSubview(homeButton)
        homeButton.setupHome()
        homeButton.addTarget(self, action: #selector(toHome), for: .touchUpInside)
        
        
        //CONSTRAINTS
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        homeButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        homeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 75).isActive = true
        homeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        
    }
    
    func setupCardView(){
        view.addSubview(cardView)
        
        //CONSTRANTS
        
    }
    
    func setupLabel(){
        view.addSubview(label)
        
        //CONSTRAINTS
        
    }
    
    @objc func toHome() {
        sound.soundFile = "buttonclick2"
        sound.playSound()
        self.dismiss(animated: true)
    }
}
