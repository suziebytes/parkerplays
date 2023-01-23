//
//  NumbersViewController.swift
//  ParkerPlaysv2
//
//  Created by Suzie on 12/19/22.
//

import UIKit
import AVFoundation

class NumbersViewController: UIViewController {
    let background = UIImageView(frame: UIScreen.main.bounds)
    let cardView = CardView()
    let homeButton = HomeButton()
    var sound = PlaySound()
    let ttsButton = UIButton()
    let numButton = NumberButton()
    let setupTTS = TextToSpeech()
    var count = 0
    var colorCount = 0
    var swipeArea = UILabel()
    var tapToNext = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupHomeButton()
        setupCardView()
        setupNumbersButton()
        setupSwipeArea()
        setupTap()
        setupTTSButton()
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
        let numberVC = NumbersViewController()
        if count < 10 {
            numberVC.count = count + 1
        } else {
            count = 0
        }

        let colorsList = numButton.colorList.count-1
        if colorCount < colorsList {
            numberVC.colorCount = colorCount + 1
        } else {
            colorCount = 0
        }

        navigationController?.pushViewController(numberVC, animated: true)
        sound.soundFile = "buttonclick1"
        sound.playSound()
    }
    
    @objc func labelTapped(_ sender: UITapGestureRecognizer){
        incrementCounterPushNewVC()
    }
    
    @objc func swipedRight(_ sender: UISwipeGestureRecognizer){
//        if count < 10 {
//            count-=1
//        } else {
//            count = 0
//        }
//
//        let colorsList = numButton.colorList.count-1
//
//        if colorCount < colorsList {
//            colorCount-=1
//        } else {
//            colorCount = 0
//        }
//
//        let numberVC = NumbersViewController()
//        numberVC.count = count
//        numberVC.colorCount = colorCount
        navigationController?.popViewController(animated: true)
        sound.soundFile = "buttonclick1"
        sound.playSound()
    }
    
    @objc func swipedLeft(_ sender: UISwipeGestureRecognizer){
       incrementCounterPushNewVC()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true    }


    func setupBackground() {
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
//        cardView.heightAnchor.constraint(equalToConstant: 605).isActive = true
        cardView.widthAnchor.constraint(equalToConstant: 315).isActive = true
    }
    
    func setupNumbersButton(){
        view.addSubview(numButton)
        numButton.setupNumButton(colorCount: colorCount)
        numButton.setTitle(String(count), for: .normal)
//        setupTTS.playTTS(name: String(count))
//        numButton.addTarget(self, action: #selector(newCount), for: .touchUpInside)
        
        // CONSTRAINTS
        numButton.translatesAutoresizingMaskIntoConstraints = false
        numButton.topAnchor.constraint(equalTo: cardView.topAnchor).isActive = true
        numButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor).isActive = true
        numButton.leftAnchor.constraint(equalTo: cardView.leftAnchor).isActive = true
        numButton.rightAnchor.constraint(equalTo: cardView.rightAnchor).isActive = true
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

    @objc func toTTS(){
        setupTTS.playTTS(name:String(count))
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
    
    @objc func toHome() {
        sound.soundFile = "buttonclick2"
        sound.playSound()
        self.dismiss(animated: true)
    }
    
}
