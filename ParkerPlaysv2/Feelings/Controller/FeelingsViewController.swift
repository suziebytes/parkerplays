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
    let nextButton = UIButton()
    let label = AnimalLabelView()
    let feelingList = FeelingList()
    var count = 0

    override func viewDidLoad() {
      super.viewDidLoad()
        
        setupBackground()
        setupHomeButton()
        setupCardView()
        setupAnimation()
        setupNextFeeling()
        setupLabel()
        setupTTSButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setupAnimation() {
        let feeling = feelingList.feelingArray[count]

        // 2. Start AnimationView with animation name (without extension)
        animationView = .init(name: feeling)
        // 3. Set animation content mode
        animationView!.contentMode = .scaleAspectFit
        // 4. Set animation loop mode
        animationView!.loopMode = .loop
        // 5. Adjust animation speed
        animationView!.animationSpeed = 0.5
        cardView.addSubview(animationView!)
        // 6. Play animation
        animationView!.play()
        
        //CONSTRAINTS
        animationView!.translatesAutoresizingMaskIntoConstraints = false
        animationView!.topAnchor.constraint(equalTo: cardView.topAnchor).isActive = true
        animationView!.bottomAnchor.constraint(equalTo: cardView.bottomAnchor).isActive = true
        animationView!.leftAnchor.constraint(equalTo: cardView.leftAnchor).isActive = true
        animationView!.rightAnchor.constraint(equalTo: cardView.rightAnchor).isActive = true
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
    
    func setupNextFeeling(){
        cardView.addSubview(nextButton)
        nextButton.addTarget(self, action: #selector(nextFeeling), for: .touchUpInside)
//        nextButton.backgroundColor = .green
        
        //CONSTRAINTS
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.topAnchor.constraint(equalTo: cardView.topAnchor).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor).isActive = true
        nextButton.widthAnchor.constraint(equalTo: cardView.widthAnchor).isActive = true
        nextButton.heightAnchor.constraint(equalTo: cardView.heightAnchor).isActive = true
    }
    
    @objc func nextFeeling() {
        if count < feelingList.feelingArray.count-1 {
            count+=1
        } else {
            count = 0
        }
        
        let feelingVC = FeeligsViewController()
        feelingVC.count = count
        feelingVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(feelingVC, animated: true)
        sound.soundFile = "buttonclick1"
        sound.playSound()
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
    
    func setupLabel() {
        let labelTitle = feelingList.feelingArray[count]
        view.addSubview(label)
        label.animalLabel.text = labelTitle
        
        //CONSTRAINTS
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 315).isActive =  true
        label.heightAnchor.constraint(equalToConstant: 65).isActive = true
        label.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 10).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
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
        let labelTitle = feelingList.feelingArray[count]

        TTS.playTTS(name: labelTitle)
    }

}
