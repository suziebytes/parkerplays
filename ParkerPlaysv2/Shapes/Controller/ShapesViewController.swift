//
//  ShapesViewController.swift
//  ParkerPlaysv2
//
//  Created by Suzie on 12/20/22.
//

import UIKit

class ShapesViewController: UIViewController {
    let background = UIImageView(frame: UIScreen.main.bounds)
    let cardView = CardView()
    let homeButton = HomeButton()
    var sound = PlaySound()
    let TTS = TextToSpeech()
    let ttsButton = UIButton()
    let shapeButton = ShapeButton()
    let shapeList = ShapeList()
    let randNum = Int.random(in: 0..<11)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupCardView()
        setupHomeButton()
        setupShapeButton()
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
    
    func setupShapeButton(){
        let image = shapeList.shapeList
        let shape = image[randNum]

        view.addSubview(shapeButton)
        shapeButton.setupButton(shape: shape)
        shapeButton.addTarget(self, action: #selector(newShape), for: .touchUpInside)
        
        //CONSTRAINTS
        shapeButton.translatesAutoresizingMaskIntoConstraints = false
        shapeButton.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 100).isActive = true
        shapeButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -100).isActive = true
        shapeButton.leftAnchor.constraint(equalTo: cardView.leftAnchor).isActive = true
        shapeButton.rightAnchor.constraint(equalTo: cardView.rightAnchor).isActive = true
    }
    
    @objc func newShape(){
        let shapeVC = ShapesViewController()
        
        shapeVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(shapeVC, animated: true)
        
        sound.soundFile = "buttonclick"
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
        let image = shapeList.shapeList
        let shape = image[randNum]
        
        TTS.playTTS(name: shape)
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
