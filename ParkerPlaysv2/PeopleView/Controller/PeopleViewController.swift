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

    
    var image = String(Int.random(in: 0..<20))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupCardView()
        peopleImage()
        setupToAnimalButton()
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
        let animalVC = AnimalViewController()
        animalVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(animalVC, animated: true)
    }
   
}

