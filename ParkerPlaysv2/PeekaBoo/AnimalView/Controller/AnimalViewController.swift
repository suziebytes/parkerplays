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
    let animalLabelView = AnimalLabelView()
    let toPeople = UIButton()
    let randNum = Int.random(in: 0..<40)
    var sound = PlaySound()
    let homeButton = HomeButton()
    let ttsButton = UIButton()
    let TTS = TextToSpeech()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        setupBackground()
        setupCardView()
        setupAnimalImage()
        setupLabel()
        setupVCButton()
        setupHomeButton()
        setupTTSButton()
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
        cardView.imageView.contentMode = .scaleAspectFit
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
    
    func setupTTSButton() {
        view.addSubview(ttsButton)
        ttsButton.setImage(UIImage(named: "playcircle.svg"), for: .normal)
        ttsButton.addTarget(self, action: #selector(toTTS), for: .touchUpInside)
         
        //CONSTRAINTS
        ttsButton.translatesAutoresizingMaskIntoConstraints = false
        ttsButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -10).isActive = true
        ttsButton.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -10).isActive = true
    }
    
    @objc func toTTS() {
      print("play tapped")
        TTS.playTTS(name: animal.animalList[randNum])
    }
    
    func setupLabel(){
        let labelTitle = animal.animalList[randNum]
        view.addSubview(animalLabelView)
        animalLabelView.animalLabel.text = labelTitle.lowercased()
        
        //CONSTRAINTS
        animalLabelView.translatesAutoresizingMaskIntoConstraints = false
        animalLabelView.widthAnchor.constraint(equalToConstant: 315).isActive =  true
        animalLabelView.heightAnchor.constraint(equalToConstant: 65).isActive = true
        animalLabelView.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 10).isActive = true
        animalLabelView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func backToPeople(){
        navigationController?.popViewController(animated: true)
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
        let homeVC = HomeViewController()
        let navVC = UINavigationController(rootViewController: homeVC)
            navVC.modalPresentationStyle = .fullScreen
            present(navVC, animated: true)
        }
    
}


//check to see if there's random as in array.randomelement

