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
    var count = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupCardView()
        peopleImage()
        setupToAnimalButton()
        setupHomeButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sound.soundFile = "Peek A - boosted"
        sound.playSound()
        peopleImage()
        self.navigationItem.setHidesBackButton(true, animated: true)
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
//        cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        cardView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 605).isActive = true
        cardView.widthAnchor.constraint(equalToConstant: 315).isActive = true
    }
    
    func peopleImage(){
        let image = String(count)
        cardView.setupImage(image: image)
     
    }
    
    func setupToAnimalButton(){
        view.addSubview(toAnimalButton)
        toAnimalButton.backgroundColor = .clear
        toAnimalButton.addTarget(self, action: #selector(toAnimal), for: .touchUpInside)
        
        //CONSTRAINTS
        toAnimalButton.translatesAutoresizingMaskIntoConstraints = false
        toAnimalButton.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        toAnimalButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        toAnimalButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        toAnimalButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    @objc func toAnimal(){
        
        if count < 21 {
            count+=1
        } else {
            count = 1
        }
        print("this is \(count)")
        
//        sound.soundFile = "Boo"
//        sound.playSound()
        
    
        let animalVC = AnimalViewController()
        animalVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(animalVC, animated: true)
    }
    
    func setupHomeButton(){
        view.addSubview(homeButton)
        homeButton.setupHome()
        homeButton.addTarget(self, action: #selector(toHome), for: .touchUpInside)
        
        
        //CONSTRAINTS
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        homeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 75).isActive = true
        homeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
    }
    
    @objc func toHome() {
        sound.soundFile = "buttonclick2"
        sound.playSound()
        self.dismiss(animated: true)
    }

}
   
