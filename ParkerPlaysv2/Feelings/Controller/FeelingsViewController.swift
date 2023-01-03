//
//  FeelingsViewController.swift
//  ParkerPlaysv2
//
//  Created by Suzie on 1/2/23.
//

import UIKit
import Lottie

class FeeligsViewController: UIViewController {
    // 1. Create the AnimationView
    private var animationView: LottieAnimationView?
    let background = UIImageView(frame: UIScreen.main.bounds)
    let cardView = CardView()
    let homeButton = HomeButton()
    var sound = PlaySound()
    let ttsButton = UIButton()
    let TTS = TextToSpeech()
    let animalLabelView = AnimalLabelView()
    let feelingList = FeelingList()
    var count = 0

    override func viewDidLoad() {
      super.viewDidLoad()
        
        setupBackground()
        setupHomeButton()
        setupCardView()
        setupAnimation()
//        setupTTSButton()
    }
    
    
    func setupAnimation() {
        var feeling = feelingList[count]
        
        // 2. Start AnimationView with animation name (without extension)
        animationView = .init(name: feeling)
        animationView!.frame = view.bounds
        // 3. Set animation content mode
        animationView!.contentMode = .scaleAspectFit
        // 4. Set animation loop mode
        animationView!.loopMode = .loop
        // 5. Adjust animation speed
        animationView!.animationSpeed = 0.5
        view.addSubview(animationView!)
        // 6. Play animation

        animationView!.play()
    }
    
    func setupHomeButton(){
        view.addSubview(homeButton)
        homeButton.setupHome()
        homeButton.addTarget(self, action: #selector(toHome), for: .touchUpInside)
        homeButton.backgroundColor = .red
        
        //CONSTRAINTS
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        homeButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        homeButton.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        homeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
    }

    @objc func toHome() {
        sound.soundFile = "buttonclick2"
        sound.playSound()
        self.dismiss(animated: true)
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
        cardView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7).isActive = true
        cardView.topAnchor.constraint(equalTo: homeButton.bottomAnchor, constant: 10).isActive = true
        cardView.widthAnchor.constraint(equalToConstant: 315).isActive = true
    }
    
//    func setupTTSButton() {
//        view.addSubview(ttsButton)
//        ttsButton.setImage(UIImage(named: "playcircle.svg"), for: .normal)
//        ttsButton.addTarget(self, action: #selector(toTTS), for: .touchUpInside)
//
//        //CONSTRAINTS
//        ttsButton.translatesAutoresizingMaskIntoConstraints = false
//        ttsButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -10).isActive = true
//        ttsButton.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -10).isActive = true
//    }
    
//    @objc func toTTS() {
//      print("play tapped")
//        TTS.playTTS(name: animal.animalList[randNum])
//    }
    
//    func setupLabel(){
//        let labelTitle = animal.animalList[randNum]
//        view.addSubview(animalLabelView)
//        animalLabelView.animalLabel.text = labelTitle.lowercased()
//
//        //CONSTRAINTS
//        animalLabelView.translatesAutoresizingMaskIntoConstraints = false
//        animalLabelView.widthAnchor.constraint(equalToConstant: 315).isActive =  true
//        animalLabelView.heightAnchor.constraint(equalToConstant: 65).isActive = true
//        animalLabelView.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 10).isActive = true
//        animalLabelView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//    }
    
    
}
