//
//  Opposites.swift
//  ParkerPlaysv2
//
//  Created by Suzie on 1/3/23.
//

import UIKit
 
class OppositesViewController: UIViewController {
    let background = UIImageView(frame: UIScreen.main.bounds)
    let frontLabel = AnimalLabelView()
    let backLabel = AnimalLabelView()
    let frontView = CardView()
    let homeButton = HomeButton()
    var sound = PlaySound()
    let nextOppositeButton = UIButton()
    let ttsFrontButton = UIButton()
    let ttsBackButton = UIButton()
    let TTS = TextToSpeech()
    let flipButton = OppositeButton()
    let flipButtonA = OppositeButton()
    let backView = CardView()
    var isFlipped: Bool = false
    let cardContainer = UIView()
    let opposite = Opposite()
    let front = 0
    let back = 1
    var count = 0
    var swipeArea = UILabel()
    var tapToNext = UILabel()
    let premiumView = PremiumViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupHomeButton()
        setupCardContainer()
        setupNextOppositeButton()
        setupSwipeArea()
        setupTap()
        setupBackView()
        setupFrontView()
        setupBackLabel()
        setupFrontLabel()
        setupBackTTSButton()
        setupFrontTTSButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
 
    func setupTap(){
        view.addSubview(tapToNext)
        
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.labelTapped(_:)))
        swipeArea.isUserInteractionEnabled = true
        swipeArea.addGestureRecognizer(labelTap)
        
        //CONSTRAINTS
        tapToNext.translatesAutoresizingMaskIntoConstraints = false
        tapToNext.topAnchor.constraint(equalTo: cardContainer.topAnchor,constant: 100).isActive = true
        tapToNext.bottomAnchor.constraint(equalTo: cardContainer.bottomAnchor, constant: -100).isActive = true
        tapToNext.rightAnchor.constraint(equalTo: cardContainer.rightAnchor).isActive = true
        tapToNext.leftAnchor.constraint(equalTo: cardContainer.leftAnchor).isActive = true
    }
    
    func setupSwipeArea(){
        view.addSubview(swipeArea)

        let labelSwipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swipedRight(_:)))
        swipeArea.isUserInteractionEnabled = true
        labelSwipeRight.direction = .right
        swipeArea.addGestureRecognizer(labelSwipeRight)

        
        let labelSwipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipedLeft(_:)))
        swipeArea.isUserInteractionEnabled = true
        labelSwipeLeft.direction = .left
        swipeArea.addGestureRecognizer(labelSwipeLeft)
        
        //CONSTRAINTS
        swipeArea.translatesAutoresizingMaskIntoConstraints = false
        swipeArea.topAnchor.constraint(equalTo: cardContainer.topAnchor, constant: 100).isActive = true
        swipeArea.bottomAnchor.constraint(equalTo: cardContainer.bottomAnchor, constant: -100).isActive = true
        swipeArea.rightAnchor.constraint(equalTo: cardContainer.rightAnchor).isActive = true
        swipeArea.leftAnchor.constraint(equalTo: cardContainer.leftAnchor).isActive = true
    }
    
    func incrementCounterPushNewVC() {
        let oppositeVC = OppositesViewController()
        let hasPremium = UserDefaults.standard.bool(forKey: "PPPremium")
        
        if hasPremium {
            if count < opposite.oppositeList.count-1 {
                oppositeVC.count = count + 1
            } else {
                count = 0
            }
            navigationController?.pushViewController(oppositeVC, animated: true)
            sound.soundFile = "buttonclick1"
            sound.playSound()
            
        } else {
            if count == 2 {
                premiumView.modalPresentationStyle = .fullScreen
                present(premiumView, animated: true)
            } else {
                oppositeVC.count = count + 1
                navigationController?.pushViewController(oppositeVC, animated: true)
                sound.soundFile = "buttonclick1"
                sound.playSound()
            }
        }
    }
    
    @objc func labelTapped(_ sender: UITapGestureRecognizer){
        incrementCounterPushNewVC()
    }
    
    @objc func swipedRight(_ sender: UISwipeGestureRecognizer){
        navigationController?.popViewController(animated: true)
        sound.soundFile = "buttonclick1"
        sound.playSound()
    }
    
    @objc func swipedLeft(_ sender: UISwipeGestureRecognizer){
       incrementCounterPushNewVC()
    }
    
    func setupBackground(){
        view.addSubview(background)
        background.image = UIImage(named: "gradientbg")
    }
    
    func setupCardContainer() {
        view.addSubview(cardContainer)
        //CONSTRAINTS
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
        homeButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        homeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        homeButton.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        homeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
    }
    
    func setupFrontView(){
        let image = "oppositeicon"
        let frontImage = opposite.oppositeList[count][front]
        frontView.setupImage()
        frontView.setImage(image: frontImage)
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
        backView.setupImage()
        backView.setImage(image: backImage)
        backView.imageView.contentMode = .scaleAspectFit

        cardContainer.addSubview(backView)
        cardContainer.addSubview(flipButtonA)
        flipButtonA.setupButton()
        flipButtonA.setImage(UIImage(named: image), for: .normal)
        flipButtonA.addTarget(self, action: #selector(flipCard), for: .touchUpInside)
        
        backView.addSubview(ttsBackButton)
    
        //CONSTRAINTS
        flipButtonA.translatesAutoresizingMaskIntoConstraints = false
        flipButtonA.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -10).isActive = true
        flipButtonA.topAnchor.constraint(equalTo: backView.topAnchor, constant: 5).isActive = true
        flipButtonA.heightAnchor.constraint(equalToConstant: 50).isActive = true
        flipButtonA.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.centerXAnchor.constraint(equalTo: cardContainer.centerXAnchor).isActive = true
        backView.heightAnchor.constraint(equalTo: cardContainer.heightAnchor).isActive = true
        backView.widthAnchor.constraint(equalToConstant: 315).isActive = true
    }
    
    
    @objc func flipCard() {
        frontView.imageView.contentMode = .scaleAspectFit
        backView.imageView.contentMode = .scaleAspectFit

        isFlipped = !isFlipped

        var cardToFlip = frontView
        var bottomCard = backView
        var labelToFlip = frontLabel
        var bottomLabel = backLabel
        var ttsButton = ttsFrontButton
        var ttsBottomButton = ttsBackButton
       
        if isFlipped == true {
            cardToFlip = frontView
            bottomCard = backView
        } else {
            cardToFlip = backView
            bottomCard = frontView
        }
        
        if isFlipped == true {
           labelToFlip = frontLabel
            bottomLabel = backLabel
        } else {
            labelToFlip = backLabel
             bottomLabel = frontLabel
        }
        
        if isFlipped == true {
           ttsButton = ttsFrontButton
            ttsBottomButton = ttsBackButton
        } else {
            ttsButton = ttsBackButton
             ttsBottomButton = ttsFrontButton
        }
        
        //refractor later so to couple UIView.transitions and if/else into one
        UIView.transition(
            from: cardToFlip,
            to: bottomCard,
            duration: 1,
            options: [.transitionFlipFromRight, .showHideTransitionViews],
            completion: nil
        )
        
        UIView.transition(
            from: labelToFlip,
            to: bottomLabel,
            duration: 1,
            options: [.transitionFlipFromRight, .showHideTransitionViews],
            completion: nil
        )
        UIView.transition(
            from: ttsButton,
            to: ttsBottomButton,
            duration: 1,
            options: [.transitionFlipFromRight, .showHideTransitionViews],
            completion: nil
        )
    }
    
    func setupNextOppositeButton(){
        cardContainer.addSubview(nextOppositeButton)
        nextOppositeButton.addTarget(self, action: #selector(nextOpposite), for: .touchUpInside)
        
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
       
       let frontImage = opposite.oppositeList[count][front]
       let backImage = opposite.oppositeList[count][back]

       frontView.setImage(image: frontImage)
       backView.setImage(image: backImage)
       frontView.imageView.contentMode = .scaleAspectFit
       backView.imageView.contentMode = .scaleAspectFit
       frontLabel.animalLabel.text = frontImage
       backLabel.animalLabel.text = backImage

       sound.soundFile = "buttonclick1"
       sound.playSound()
    }

    func setupFrontLabel() {
        let frontImage = opposite.oppositeList[count][front]

        frontLabel.animalLabel.text = frontImage
        cardContainer.addSubview(frontLabel)

        //CONSTRAINTS
        frontLabel.translatesAutoresizingMaskIntoConstraints = false
        frontLabel.widthAnchor.constraint(equalToConstant: 315).isActive =  true
        frontLabel.heightAnchor.constraint(equalToConstant: 65).isActive = true
        frontLabel.topAnchor.constraint(equalTo: cardContainer.bottomAnchor, constant: 10).isActive = true
        frontLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupBackLabel() {
        let backImage = opposite.oppositeList[count][back]

       backLabel.animalLabel.text = backImage
        cardContainer.addSubview(frontLabel)
        cardContainer.addSubview(backLabel)
        
        //CONSTRAINTS
        backLabel.translatesAutoresizingMaskIntoConstraints = false
        backLabel.widthAnchor.constraint(equalToConstant: 315).isActive =  true
        backLabel.heightAnchor.constraint(equalToConstant: 65).isActive = true
        backLabel.topAnchor.constraint(equalTo: cardContainer.bottomAnchor, constant: 10).isActive = true
        backLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupFrontTTSButton(){
        cardContainer.addSubview(ttsFrontButton)
        ttsFrontButton.setImage(UIImage(named: "playcircle.svg"), for: .normal)
        ttsFrontButton.addTarget(self, action: #selector(toFrontTTS), for: .touchUpInside)
         
        //CONSTRAINTS
        ttsFrontButton.translatesAutoresizingMaskIntoConstraints = false
        ttsFrontButton.bottomAnchor.constraint(equalTo: cardContainer.bottomAnchor, constant: -10).isActive = true
        ttsFrontButton.rightAnchor.constraint(equalTo: cardContainer.rightAnchor, constant: 20).isActive = true
        ttsFrontButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        ttsFrontButton.widthAnchor.constraint(equalToConstant: 100).isActive  = true

    }
    
    func setupBackTTSButton(){
        cardContainer.addSubview(ttsBackButton)
        ttsBackButton.setImage(UIImage(named: "playcircle.svg"), for: .normal)
        ttsBackButton.addTarget(self, action: #selector(toBackTTS), for: .touchUpInside)
         
        //CONSTRAINTS
        ttsBackButton.translatesAutoresizingMaskIntoConstraints = false
        ttsBackButton.bottomAnchor.constraint(equalTo: cardContainer.bottomAnchor, constant: -10).isActive = true
        ttsBackButton.rightAnchor.constraint(equalTo: cardContainer.rightAnchor, constant: 20).isActive = true
        ttsBackButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        ttsBackButton.widthAnchor.constraint(equalToConstant: 100).isActive  = true
    }
    
    @objc func toFrontTTS() {
        TTS.playTTS(name: opposite.oppositeList[count][front])
    }
    
    @objc func toBackTTS() {
        TTS.playTTS(name: opposite.oppositeList[count][back])
    }
     
     @objc func toHome() {
         sound.soundFile = "buttonclick2"
         sound.playSound()
         self.dismiss(animated: true)
     }
}

    
   
