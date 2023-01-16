//
//  ABC.swift
//  ParkerPlaysv2
//
//  Created by Suzie on 12/18/22.
//

import UIKit

class ABCViewController: UIViewController {
    let background = UIImageView(frame: UIScreen.main.bounds)
    let homeButton = HomeButton()
    let cardView = CardView()
    var sound = PlaySound()
    let alphabet = ABCList()
    let abcButton = ABCButton()
    let abcView = ABCButton()
    let ttsButton = UIButton()
    let TTS = TextToSpeech()
    var count = 0
    var colorCount = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupHomeButton()
        setupCardView()
        setupLetter()
        setupTTSButton()

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
    
    func setupLetter(){
        let letter = alphabet.alphabet[count]
        cardView.addSubview(abcButton)
        abcButton.setupButton(letter: letter, colorCount: colorCount)
        abcButton.addTarget(self, action: #selector(newLetter), for: .touchUpInside)
        
        //add target to go to the next button / dismiss and call ABCbutton again?
        
        //CONSTRAINTS
        abcButton.translatesAutoresizingMaskIntoConstraints = false
        abcButton.topAnchor.constraint(equalTo: cardView.topAnchor).isActive = true
        abcButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor).isActive = true
        abcButton.leftAnchor.constraint(equalTo: cardView.leftAnchor).isActive = true
        abcButton.rightAnchor.constraint(equalTo: cardView.rightAnchor).isActive = true
    }
    
    @objc func newLetter(){
        
        if count < 25 {
            count+=1
        } else {
            count = 0
        }
        
        
        let colorsList = abcButton.colorList.count-1
        if colorCount < colorsList {
            colorCount+=1
        } else {
            colorCount = 0
        }
    
    
        let abcVC = ABCViewController()
        abcVC.count = count
        abcVC.colorCount = colorCount
        abcVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(abcVC, animated: true)
        sound.soundFile = "buttonclick1"
        sound.playSound()
    }
     
    func setupTTSButton(){
        view.addSubview(ttsButton)
        ttsButton.setImage(UIImage(named: "playcircle.svg"), for: .normal)
        ttsButton.addTarget(self, action: #selector(toTTS), for: .touchUpInside)
         
        //CONSTRAINTS
        ttsButton.translatesAutoresizingMaskIntoConstraints = false
        ttsButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -10).isActive = true
        ttsButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        ttsButton.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: 20).isActive = true
        ttsButton.widthAnchor.constraint(equalToConstant: 100).isActive  = true
    }
    
    @objc func toTTS() {
        TTS.playTTS(name: alphabet.alphabet[count].lowercased())
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
