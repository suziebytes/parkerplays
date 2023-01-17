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
    var swipeArea = UILabel()
    var tapToNext = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupHomeButton()
        setupCardView()
        setupLetter()
        setupTTSButton()
        setupSwipeArea()
        setupTap()
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
    
    @objc func labelTapped(_ sender: UITapGestureRecognizer){
        incrementCounterPushNewVC()
    }
    
    func incrementCounterPushNewVC() {
        //create instance of NEXT VC
        let abcVC = ABCViewController()

        //local current count
        if count < 25 {
            //update the NEW VC *by using* current count + 1 of CURRENT VC
            abcVC.count = count + 1
        } else {
            count = 0
        }

        let colorsList = abcButton.colorList.count-1
        
        if colorCount < colorsList {
            abcVC.colorCount = colorCount + 1
        } else {
            colorCount = 0
        }
        
        navigationController?.pushViewController(abcVC, animated: true)
        sound.soundFile = "buttonclick1"
        sound.playSound()
    }
    
    // COMPARE WITH THE ONE BELOW ON HOW VC IS BEING PRESENTED / VARIABLES USED
    @objc func swipedRight(_ sender: UISwipeGestureRecognizer){
//        if count < 25 {
//            count-=1
//        } else {
//            count = 0
//        }
//
//        let colorsList = abcButton.colorList.count-1
//
//        if colorCount < colorsList {
//            colorCount-=1
//        } else {
//            colorCount = 0
//        }
//
//        let abcVC = ABCViewController()
//        abcVC.count = count
//        abcVC.colorCount = colorCount
//        count+=1
        navigationController?.popViewController(animated: true)
        sound.soundFile = "buttonclick1"
        sound.playSound()
    }
    
    @objc func swipedLeft(_ sender: UISwipeGestureRecognizer){
        incrementCounterPushNewVC()
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
        cardView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7).isActive = true
        cardView.topAnchor.constraint(equalTo: homeButton.bottomAnchor, constant: 10).isActive = true
        cardView.widthAnchor.constraint(equalToConstant: 315).isActive = true
    }
    
    func setupLetter(){
        print("this is the \(count)")
        let letter = alphabet.alphabet[count]
        cardView.addSubview(abcButton)
        abcButton.setupButton(letter: letter, colorCount: colorCount)
        
        //CONSTRAINTS
        abcButton.translatesAutoresizingMaskIntoConstraints = false
        abcButton.topAnchor.constraint(equalTo: cardView.topAnchor).isActive = true
        abcButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor).isActive = true
        abcButton.leftAnchor.constraint(equalTo: cardView.leftAnchor).isActive = true
        abcButton.rightAnchor.constraint(equalTo: cardView.rightAnchor).isActive = true
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
