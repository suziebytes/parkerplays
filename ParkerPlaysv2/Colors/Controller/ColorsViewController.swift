//
//  ColorsViewController.swift
//  ParkerPlaysv2
//
//  Created by Suzie on 12/25/22.
//

import UIKit

class ColorsViewController: UIViewController {
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
    var swipeArea = UILabel()
    var tapToNext = UILabel()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupHomeButton()
        setupCardView()
        setupLabel()
        setupNewColor()
        colorImage()
        setupSwipeArea()
        setupTap()
        setupTTSButton()
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
        tapToNext.topAnchor.constraint(equalTo: cardView.topAnchor).isActive = true
        tapToNext.bottomAnchor.constraint(equalTo: cardView.bottomAnchor).isActive = true
        tapToNext.rightAnchor.constraint(equalTo: cardView.rightAnchor).isActive = true
        tapToNext.leftAnchor.constraint(equalTo: cardView.leftAnchor).isActive = true
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
        swipeArea.topAnchor.constraint(equalTo: cardView.topAnchor).isActive = true
        swipeArea.bottomAnchor.constraint(equalTo: cardView.bottomAnchor).isActive = true
        swipeArea.rightAnchor.constraint(equalTo: cardView.rightAnchor).isActive = true
        swipeArea.leftAnchor.constraint(equalTo: cardView.leftAnchor).isActive = true
    }
    
    func incrementCounterPushNewVC() {
        let colorsVC = ColorsViewController()
        if count < color.colorList.count-1 {
            colorsVC.count = count + 1
        } else {
            count = 0
        }

        navigationController?.pushViewController(colorsVC, animated: true)
        sound.soundFile = "buttonclick1"
        sound.playSound()
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
        
        //CONSTRAINTS
        background.translatesAutoresizingMaskIntoConstraints = false
        background.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        background.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        background.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        background.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    func setupHomeButton(){
        view.addSubview(homeButton)
        homeButton.setupHome()
        homeButton.addTarget(self, action: #selector(toHome), for: .touchUpInside)
        
        //CONSTRAINTS
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        homeButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
//        homeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 75).isActive = true
        homeButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        homeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        homeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
    }
    
    func setupCardView(){
        view.addSubview(cardView)
        
        //CONSTRANTS
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cardView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7).isActive = true
        cardView.topAnchor.constraint(equalTo: homeButton.bottomAnchor, constant: 10).isActive = true
//        cardView.heightAnchor.constraint(equalToConstant: 605).isActive = true
        cardView.widthAnchor.constraint(equalToConstant: 315).isActive = true
    }
    
    func colorImage(){
        let image = color.colorList[count]
        cardView.setupImage()
        cardView.setImage(image: image)
        cardView.imageView.contentMode = .scaleAspectFit
    }
    
    func setupLabel() {
        let labelTitle = color.colorList[count]
        view.addSubview(label)
        label.animalLabel.text = labelTitle.lowercased()
        
        //CONSTRAINTS
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 315).isActive =  true
        label.heightAnchor.constraint(equalToConstant: 65).isActive = true
        label.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 10).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupNewColor(){
        cardView.addSubview(colorButton)
        colorButton.addTarget(self, action: #selector(newColor), for: .touchUpInside)
        
        //CONSTRAINTS
        colorButton.translatesAutoresizingMaskIntoConstraints = false
        colorButton.topAnchor.constraint(equalTo: cardView.topAnchor).isActive = true
        colorButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor).isActive = true
        colorButton.leftAnchor.constraint(equalTo: cardView.leftAnchor).isActive = true
        colorButton.rightAnchor.constraint(equalTo: cardView.rightAnchor).isActive = true
    }

   func setupTTSButton(){
       view.addSubview(ttsButton)
       ttsButton.setImage(UIImage(named: "playcircle.svg"), for: .normal)
       ttsButton.addTarget(self, action: #selector(toTTS), for: .touchUpInside)
        
       //CONSTRAINTS
       ttsButton.translatesAutoresizingMaskIntoConstraints = false
       ttsButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -10).isActive = true
       ttsButton.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: 20).isActive = true
       ttsButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
       ttsButton.widthAnchor.constraint(equalToConstant: 100).isActive  = true
   }
   
   @objc func toTTS() {
       TTS.playTTS(name: color.colorList[count])
   }
    
    
    @objc func toHome() {
        sound.soundFile = "buttonclick2"
        sound.playSound()
        self.dismiss(animated: true)
    }
    
    @objc func newColor(){
        if count < color.colorList.count {
            count+=1
        } else {
            count = 0
        }
        
        let colorVC = ColorsViewController()
        colorVC.count = count
        colorVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(colorVC, animated: true)
        sound.soundFile = "buttonclick1"
        sound.playSound()
    }
}
