//
//  ShapesViewController.swift
//  ParkerPlaysv2
//
//  Created by Suzie on 12/20/22.
//

import UIKit

class ShapesViewController: UIViewController{
    let background = UIImageView(frame: UIScreen.main.bounds)
    let cardView = CardView()
    let homeButton = HomeButton()
    var sound = PlaySound()
    let TTS = TextToSpeech()
    let ttsButton = UIButton()
    let shapeButton = ShapeButton()
    let shapeList = ShapeList()
    let shapeLabel = ShapeLabel()
    var count = 0
    
    var swipeArea = UILabel()
    var tapToNext = UILabel()
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setupBackground()
        setupHomeButton()
        setupCardView()
        setupShapeButton()
        setupTTSButton()
        setupShapeLabel()
        setupSwipeArea()
        setupTap()
    }
    
    override func viewWillAppear(_ animated: Bool){
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
        let shapesVC = ShapesViewController()

        //local current count
        if count < 11 {
            //update the NEW VC *by using* current count + 1 of CURRENT VC
            shapesVC.count = count + 1
        } else {
            count = 0
        }

        navigationController?.pushViewController(shapesVC, animated: true)
        sound.soundFile = "buttonclick1"
        sound.playSound()
    }
    
    @objc func swipedRight(_ sender: UISwipeGestureRecognizer){
//        let shapesArray = shapeList.shapeList.count-1
//
//        if count < shapesArray {
//            count+=1
//        } else {
//            count = 0
//        }
//
//        let shapeVC = ShapesViewController()
//        shapeVC.count = count
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
    
    func setupShapeButton(){
        let image = shapeList.shapeList
        let shape = image[count]

        view.addSubview(shapeButton)
        shapeButton.setupButton(shape: shape)
        shapeButton.addTarget(self, action: #selector(newShape), for: .touchUpInside)
        shapeButton.imageView?.contentMode = .scaleAspectFit
        
        //CONSTRAINTS
        shapeButton.translatesAutoresizingMaskIntoConstraints = false
        shapeButton.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 100).isActive = true
        shapeButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -100).isActive = true
        shapeButton.leftAnchor.constraint(equalTo: cardView.leftAnchor).isActive = true
        shapeButton.rightAnchor.constraint(equalTo: cardView.rightAnchor).isActive = true
    }
    
    @objc func newShape(){

        if count < shapeList.shapeList.count {
            count+=1
        } else {
            count = 0
        }
        
        let shapeVC = ShapesViewController()
        shapeVC.count = count
        shapeVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(shapeVC, animated: true)
        
        sound.soundFile = "buttonclick"
        sound.playSound()
    }
    
    func setupShapeLabel(){
        view.addSubview (shapeLabel)
        let labelTitle = shapeList.shapeList[count]
        shapeLabel.shapeLabel.text = labelTitle.lowercased()
        
        //CONSTRANT
        shapeLabel.translatesAutoresizingMaskIntoConstraints = false
        shapeLabel.widthAnchor.constraint(equalToConstant: 315).isActive =  true
        shapeLabel.heightAnchor.constraint(equalToConstant: 65).isActive = true
        shapeLabel.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 10).isActive = true
        shapeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
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
        let image = shapeList.shapeList
        let shape = image[count]
        
        TTS.playTTS(name: shape)
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
