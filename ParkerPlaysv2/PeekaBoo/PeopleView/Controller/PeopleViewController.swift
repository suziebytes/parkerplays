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
    let toAnimalButton = UIButton()
    let homeButton = HomeButton()
    var sound = PlaySound()
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupHomeButton()
        setupCardView()
        peopleImage()
        setupToAnimalButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sound.soundFile = "PeekASound-boosted"
        sound.playSound()
        peopleImage()
        
        if count < 20 {
            count+=1
        } else {
            count = 0
        }
        
        let image = String(count)
        cardView.setImage(image: image)
        
        self.navigationController?.navigationBar.isHidden = true
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
        cardView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.75).isActive = true
        cardView.topAnchor.constraint(equalTo: homeButton.bottomAnchor, constant: 10).isActive = true
        cardView.widthAnchor.constraint(equalToConstant: 315).isActive = true
    }
    
    func peopleImage(){
        let image = String(count)
        cardView.setupImage()
        cardView.setImage(image: image)
    }
    
    func setupToAnimalButton(){
        view.addSubview(toAnimalButton)
        toAnimalButton.addTarget(self, action: #selector(toAnimal), for: .touchUpInside)
        //CONSTRAINTS
        toAnimalButton.translatesAutoresizingMaskIntoConstraints = false
        toAnimalButton.topAnchor.constraint(equalTo: cardView.topAnchor).isActive = true
        toAnimalButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor).isActive = true
        toAnimalButton.leftAnchor.constraint(equalTo: cardView.leftAnchor).isActive = true
        toAnimalButton.rightAnchor.constraint(equalTo: cardView.rightAnchor).isActive = true
    }
    
    @objc func toAnimal(){
        sound.soundFile = "BooSound-boosted"
        sound.playSound()
        
        let animalVC = AnimalViewController()
        animalVC.incrementCount()
        animalVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(animalVC, animated: true)
    }
    
    func setupHomeButton(){
        view.addSubview(homeButton)
        homeButton.setupHome()
        homeButton.addTarget(self, action: #selector(toHome), for: .touchUpInside)
        //CONSTRAINTS
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        homeButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        homeButton.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        homeButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        homeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        homeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
    }
    
    @objc func toHome() {
        sound.soundFile = "buttonclick2"
        sound.playSound()
        self.dismiss(animated: true)
    }
}

