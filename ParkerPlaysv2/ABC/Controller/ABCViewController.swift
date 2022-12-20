//
//  ABC.swift
//  ParkerPlaysv2
//
//  Created by Suzie on 12/18/22.
//

import UIKit

class ABCViewController: UIViewController {
    let background = UIImageView(frame: UIScreen.main.bounds)
    let cardView = CardView()
    let homeButton = HomeButton()
    var sound = PlaySound()
    let alphabet = ABCList()
    let abcButton = ABCButton()
    let abcView = ABCButton()
    let randNum = Int.random(in: 0..<20)
    let ttsButton = UIButton()
    let TTS = TextToSpeech()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupCardView()
        setupHomeButton()
        setupLetter()
        setupTTSButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
 
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
        cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 530).isActive = true
        cardView.widthAnchor.constraint(equalToConstant: 315).isActive = true
    }
    
    func setupLetter(){
        let letter = alphabet.alphabet[randNum]
        cardView.addSubview(abcButton)
        abcButton.setupButton(letter: letter)
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
        let abcVC = ABCViewController()
        
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
        ttsButton.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -10).isActive = true
    }
    
    @objc func toTTS() {
        TTS.playTTS(name: alphabet.alphabet[randNum].lowercased())
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
        self.dismiss(animated: true)
    }

    
}
