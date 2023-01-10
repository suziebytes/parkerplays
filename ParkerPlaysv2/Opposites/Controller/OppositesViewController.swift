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
    let frontView = CardView()
    let homeButton = HomeButton()
    var sound = PlaySound()
    let color = Color()
    var count = 0
    let nextOppositeButton = UIButton()
    let ttsButton = UIButton()
    let TTS = TextToSpeech()
    let flipButton = OppositeButton()
    let backView = CardView()
    var isFlipped: Bool = false
    let cardContainer = UIView()
    let opposite = Opposite()
    let front = 0
    let back = 1

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupHomeButton()
        setupCardContainer()
        setupFrontView()
        setupBackView()
        setupLabel()
        setupNextOppositeButton()
//        colorImage()
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
    
    func setupFrontView(){
        let image = "oppositeicon"
        let frontImage = opposite.oppositeList[count][front]
        frontView.setupImage(image: frontImage)
        frontView.imageView.contentMode = .scaleAspectFit

        cardContainer.addSubview(frontView)
        frontView.addSubview(flipButton)
        flipButton.setupButton()
        flipButton.setImage(UIImage(named: image), for: .normal)
        flipButton.addTarget(self, action: #selector(flipCard), for: .touchUpInside)
    
        //CONSTRANTS
        flipButton.translatesAutoresizingMaskIntoConstraints = false
        flipButton.rightAnchor.constraint(equalTo: frontView.rightAnchor, constant: -10).isActive = true
        flipButton.topAnchor.constraint(equalTo: frontView.topAnchor, constant: 5).isActive = true
        flipButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        flipButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        frontView.translatesAutoresizingMaskIntoConstraints = false
        frontView.centerXAnchor.constraint(equalTo: cardContainer.centerXAnchor).isActive = true
        frontView.heightAnchor.constraint(equalTo: cardContainer.heightAnchor).isActive = true
        frontView.widthAnchor.constraint(equalToConstant: 315).isActive = true
    }
    
    func setupBackView(){
        let image = "oppositeicon"
        let backImage = opposite.oppositeList[count][back]
        backView.setupImage(image: backImage)
        backView.imageView.contentMode = .scaleAspectFit

        cardContainer.addSubview(backView)
        cardContainer.addSubview(flipButton)
        flipButton.setupButton()
        flipButton.setImage(UIImage(named: image), for: .normal)
        flipButton.addTarget(self, action: #selector(flipCard), for: .touchUpInside)
        //CONSTRAINTS
        flipButton.translatesAutoresizingMaskIntoConstraints = false
        flipButton.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -10).isActive = true
        flipButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        flipButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        flipButton.topAnchor.constraint(equalTo: backView.topAnchor, constant: 25).isActive = true
        
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.centerXAnchor.constraint(equalTo: cardContainer.centerXAnchor).isActive = true
        backView.heightAnchor.constraint(equalTo: cardContainer.heightAnchor).isActive = true
        backView.widthAnchor.constraint(equalToConstant: 315).isActive = true
    }
    
    
    @objc func flipCard() {
//        let frontImage = opposite.oppositeList[count][front]
//        let backImage = opposite.oppositeList[count][back]
//
//        frontView.setupImage(image: frontImage)
//        backView.setupImage(image: backImage)
        frontView.imageView.contentMode = .scaleAspectFit
        backView.imageView.contentMode = .scaleAspectFit

        isFlipped = !isFlipped

        var cardToFlip = frontView
        var bottomCard = backView

        if isFlipped == true {
            cardToFlip = frontView
            bottomCard = backView
        } else {
            cardToFlip = backView
            bottomCard = frontView
        }

        UIView.transition(
            from: cardToFlip,
            to: bottomCard,
            duration: 1,
            options: [.transitionFlipFromRight, .showHideTransitionViews],
            completion: nil
        )
        
        }
    
    func setupNextOppositeButton(){
        cardContainer.addSubview(nextOppositeButton)
        nextOppositeButton.addTarget(self, action: #selector(nextOpposite), for: .touchUpInside)
//        nextOppositeButton.backgroundColor = .green
        nextOppositeButton.addTarget(self, action: #selector(nextOppositeImage), for: .touchUpInside)
        
        //CONSTRAINTS
        nextOppositeButton.translatesAutoresizingMaskIntoConstraints = false
        nextOppositeButton.heightAnchor.constraint(equalTo: cardContainer.heightAnchor, multiplier: 0.70).isActive = true
        nextOppositeButton.centerYAnchor.constraint(equalTo: cardContainer.centerYAnchor).isActive = true
        nextOppositeButton.widthAnchor.constraint(equalTo: cardContainer.widthAnchor).isActive = true

    }

   @objc func nextOpposite(){
       
                if count < opposite.oppositeList.count-1 {
                    count+=1
                } else {
                    count = 0
                }
       
       let oppositeVC = OppositesViewController()
       let backImage = opposite.oppositeList[count][back]

       oppositeVC.count = count
       backView.setupImage(image: backImage)
       sound.soundFile = "buttonclick1"
       sound.playSound()
    }
    
    @objc func nextOppositeImage(){
        let frontImage = opposite.oppositeList[count][front]
        frontView.imageView.contentMode = .scaleAspectFit
        frontView.setupImage(image: frontImage)
        backView.imageView.contentMode = .scaleAspectFit
    }

    
    func setupLabel() {
        //this needs to match front or back
        let labelTitle = "sample text"
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
     

    }

    
   
