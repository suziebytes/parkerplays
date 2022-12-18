//
//  AnimalViewController.swift
//  ParkerPlaysv2
//
//  Created by Suzie  on 12/16/22.
//

import UIKit
 
class AnimalViewController: UIViewController {
    let animal = Animal()
    let background = UIImageView(frame: UIScreen.main.bounds)
    let cardView = CardView()
    let animalLabel = AnimalLabel()
    let toPeople = UIButton()
    let randNum = Int.random(in: 0..<41)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupCardView()
        setupAnimalImage()
        setupLabel()
        setupVCButton()
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
    
    func setupAnimalImage(){
        let animalImage = animal.animalList[randNum]
        cardView.setupImage(image: animalImage)
    }
    
    func setupVCButton(){
        view.addSubview(toPeople)
        toPeople.addTarget(self, action: #selector(backToPeople), for: .touchUpInside)

        toPeople.translatesAutoresizingMaskIntoConstraints = false
        toPeople.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        toPeople.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        toPeople.heightAnchor.constraint(equalToConstant: 400).isActive = true
        toPeople.widthAnchor.constraint(equalToConstant: 315).isActive = true
    }
    
    func setupLabel(){
        let labelTitle = animal.animalList[randNum]
        view.addSubview(animalLabel)
        animalLabel.text = labelTitle
        
        //CONSTRAINTS
        animalLabel.translatesAutoresizingMaskIntoConstraints = false
        animalLabel.widthAnchor.constraint(equalToConstant: 315).isActive =  true
        animalLabel.heightAnchor.constraint(equalToConstant: 65).isActive = true
        animalLabel.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 10).isActive = true
        animalLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func backToPeople(){
        navigationController?.popViewController(animated: true)
    }
    
}


//check to see if there's random as in array.randomelement

