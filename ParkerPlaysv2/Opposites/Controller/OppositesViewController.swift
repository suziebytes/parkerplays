//
//  Opposites.swift
//  ParkerPlaysv2
//
//  Created by Suzie on 1/3/23.
//

import UIKit
 
class OppositesViewController: UIViewController {
    let background = UIImageView(frame: UIScreen.main.bounds)
    let label = AnimalLabelView()
    let cardView = CardView()
    let homeButton = HomeButton()
    var sound = PlaySound()
    let color = Color()
    var count = 0
    let colorButton = UIButton()
    let ttsButton = UIButton()
    let TTS = TextToSpeech()
    let flipIcon = OppositeButton()
    let backView = CardView()
    var isFlipped: Bool = false
    let cardContainer = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupHomeButton()
        setupCardContainer()
        setupCardView()
        setupBackView()
        setupLabel()
//        setupNewColor()
        colorImage()
        setupTTSButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
 
    func setupBackground(){
        view.addSubview(background)
        background.image = UIImage(named: "gradientbg")
    }
    
    func setupCardContainer() {
        view.addSubview(cardContainer)
//        cardContainer.backgroundColor = .systemPink
        
        cardContainer.translatesAutoresizingMaskIntoConstraints = false
        cardContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cardContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7).isActive = true
        cardContainer.topAnchor.constraint(equalTo: homeButton.bottomAnchor).isActive = true
        cardContainer.widthAnchor.constraint(equalToConstant: 315).isActive = true
    }
    
    func setupHomeButton(){
        view.addSubview(homeButton)
        homeButton.setupHome()
        homeButton.addTarget(self, action: #selector(toHome), for: .touchUpInside)
        
        //CONSTRAINTS
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        homeButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
//        homeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 75).isActive = true
        homeButton.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        homeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
    }
    
    func setupCardView(){
        let image = "oppositeicon"

        cardContainer.addSubview(cardView)
        cardView.addSubview(flipIcon)
        flipIcon.setupButton()
        flipIcon.setImage(UIImage(named: image), for: .normal)
        flipIcon.addTarget(self, action: #selector(flipCard), for: .touchUpInside)
    
        //CONSTRANTS
        flipIcon.translatesAutoresizingMaskIntoConstraints = false
        flipIcon.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -10).isActive = true
        flipIcon.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 5).isActive = true
        flipIcon.heightAnchor.constraint(equalToConstant: 50).isActive = true
        flipIcon.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.centerXAnchor.constraint(equalTo: cardContainer.centerXAnchor).isActive = true
        cardView.heightAnchor.constraint(equalTo: cardContainer.heightAnchor).isActive = true
//        cardView.heightAnchor.constraint(equalToConstant: 605).isActive = true
        cardView.widthAnchor.constraint(equalToConstant: 315).isActive = true
    }
    
    func setupBackView(){
        let image = "oppositeicon"

        cardContainer.addSubview(backView)
        cardContainer.addSubview(flipIcon)
        flipIcon.setupButton()
        flipIcon.setImage(UIImage(named: image), for: .normal)
        flipIcon.addTarget(self, action: #selector(flipCard), for: .touchUpInside)
        backView.backgroundColor = .red

        flipIcon.translatesAutoresizingMaskIntoConstraints = false
        flipIcon.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -10).isActive = true
        flipIcon.heightAnchor.constraint(equalToConstant: 50).isActive = true
        flipIcon.widthAnchor.constraint(equalToConstant: 50).isActive = true
        flipIcon.topAnchor.constraint(equalTo: backView.topAnchor, constant: 25).isActive = true
        
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.centerXAnchor.constraint(equalTo: cardContainer.centerXAnchor).isActive = true
        backView.heightAnchor.constraint(equalTo: cardContainer.heightAnchor).isActive = true
//        cardView.heightAnchor.constraint(equalToConstant: 605).isActive = true
        backView.widthAnchor.constraint(equalToConstant: 315).isActive = true
    }
    
    
    @objc func flipCard() {
        print("hello there")
        isFlipped = !isFlipped
        let cardToFlip = isFlipped ? cardView : backView
        let bottomCard = isFlipped ? backView : cardView
        
        UIView.transition(
            from: cardToFlip,
            to: bottomCard,
            duration: 0.5,
            options: [.transitionFlipFromRight, .showHideTransitionViews],
            completion: nil
        )
    }

    
    func colorImage(){
        let image = color.colorList[count]
        cardView.setupImage(image: image)
        cardView.imageView.contentMode = .scaleAspectFit
    }
    
    func setupLabel() {
        let labelTitle = color.colorList[count]
        cardContainer.addSubview(label)
        label.animalLabel.text = labelTitle.lowercased()
        
        //CONSTRAINTS
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 315).isActive =  true
        label.heightAnchor.constraint(equalToConstant: 65).isActive = true
        label.topAnchor.constraint(equalTo: cardContainer.bottomAnchor, constant: 10).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
   
    func setupTTSButton(){
       cardContainer.addSubview(ttsButton)
        ttsButton.setImage(UIImage(named: "playcircle.svg"), for: .normal)
        ttsButton.addTarget(self, action: #selector(toTTS), for: .touchUpInside)
         
        //CONSTRAINTS
        ttsButton.translatesAutoresizingMaskIntoConstraints = false
        ttsButton.bottomAnchor.constraint(equalTo: cardContainer.bottomAnchor, constant: -10).isActive = true
        ttsButton.rightAnchor.constraint(equalTo: cardContainer.rightAnchor, constant: -10).isActive = true
    }
    
    @objc func toTTS() {
        TTS.playTTS(name: color.colorList[count])
    }
     
     @objc func toHome() {
         sound.soundFile = "buttonclick2"
         sound.playSound()
         self.dismiss(animated: true)
     }
     
//     @objc func newColor(){
//         if count < color.colorList.count {
//             count+=1
//         } else {
//             count = 0
//         }
//
//         let colorVC = ColorsViewController()
//         colorVC.count = count
//         colorVC.modalPresentationStyle = .fullScreen
//         navigationController?.pushViewController(colorVC, animated: true)
//         sound.soundFile = "buttonclick1"
//         sound.playSound()
     }

    
   
