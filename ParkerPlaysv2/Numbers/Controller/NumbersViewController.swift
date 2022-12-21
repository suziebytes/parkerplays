//
//  NumbersViewController.swift
//  ParkerPlaysv2
//
//  Created by Suzie on 12/19/22.
//

import UIKit

class NumbersViewController: UIViewController {
    let background = UIImageView(frame: UIScreen.main.bounds)
    let cardView = CardView()
    let homeButton = HomeButton()
    var sound = PlaySound()
    let ttsButton = UIButton()
    let numButton = NumberButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupCardView()
        setupHomeButton()
        setupNumbersButton()
//        setupTTSButton()
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
    
    func setupNumbersButton(){
        view.addSubview(numButton)
        numButton.setupNumButton()
        
        numButton.addTarget(self, action: #selector(newCount), for: .touchUpInside)
        
        // CONSTRAINTS
        numButton.translatesAutoresizingMaskIntoConstraints = false
        numButton.topAnchor.constraint(equalTo: cardView.topAnchor).isActive = true
        numButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor).isActive = true
        numButton.leftAnchor.constraint(equalTo: cardView.leftAnchor).isActive = true
        numButton.rightAnchor.constraint(equalTo: cardView.rightAnchor).isActive = true
    }
    
    @objc func newCount(){
        let numberVC = NumbersViewController()
        numButton.setupTTS()
        numButton.setupNumButton()
//        navigationController?.pushViewController(numberVC, animated: true)
        
        //we want a new card to appear
        //card should update with new number count - UINavigationController to push
        }

    
//    func setupTTSButton(){
//        view.addSubview(ttsButton)
//        ttsButton.setImage(UIImage(named: "playcircle.svg"), for: .normal)
//        ttsButton.addTarget(self, action: #selector(toTTS), for: .touchUpInside)
//
//        //CONSTRAINTS
//        ttsButton.translatesAutoresizingMaskIntoConstraints = false
//        ttsButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -10).isActive = true
//        ttsButton.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -10).isActive = true
//    }
//
//    @objc func toTTS(){
//        //count is taken from numButton.setupNumButton, however, the count is in NumberButton(different class) - how do we access 'count' for TTS
//        numButton.setupTTS()
//    }
    
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
