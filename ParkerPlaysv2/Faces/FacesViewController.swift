//
//  Controller.swift
//  ParkerPlaysv2
//
//  Created by Suzie on 1/11/23.
//

import UIKit

class FacesViewController: UIViewController {
    let background = UIImageView(frame: UIScreen.main.bounds)
    let card = CardView()
    let homeButton = HomeButton()
    let addImageButton = UIButton()
    var imagePicker = UIImagePickerController()
    var sound = PlaySound()
    let label = AnimalLabelView()
    
    override func viewDidLoad() {
       super.viewDidLoad()
        setupBackground()
        setupHomeButton()
        setupCard()
        setupLabel()
        setupAddImageButton()
    }
        
    
    func setupBackground() {
        view.addSubview(background)
        background.image = UIImage(named: "gradientbg")
    }
    
    func setupHomeButton() {
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
    @objc func toHome() {
        sound.soundFile = "buttonclick2"
        sound.playSound()
        self.dismiss(animated: true)
    }
    
    func setupCard(){
        view.addSubview(card)
        //CONSTRAINT
        card.translatesAutoresizingMaskIntoConstraints = false
        card.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        card.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.65).isActive = true
        card.topAnchor.constraint(equalTo: homeButton.bottomAnchor).isActive = true
        card.widthAnchor.constraint(equalToConstant: 315).isActive = true
    }
    func setupAddImageButton() {
        view.addSubview(addImageButton)
        addImageButton.backgroundColor = UIColor(red: 79/255, green: 151/255, blue: 253/255, alpha: 1)
        addImageButton.tintColor = .white
        addImageButton.setTitle("ADD PHOTOS", for: .normal)
        addImageButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        addImageButton.layer.cornerRadius = 22
        addImageButton.addTarget(self, action: #selector(playSound), for: .touchUpInside)
        
        addImageButton.translatesAutoresizingMaskIntoConstraints = false
        addImageButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        addImageButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        addImageButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
        // this sets the button to be centered on the screen
        addImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        }
    
    @objc func playSound() {
            sound.soundFile = "buttonclick1"
            sound.playSound()
        }
    
    func setupLabel() {
        view.addSubview(label)
        label.animalLabel.text = "grandpa"
        
        //CONSTRAINTS
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 315).isActive =  true
        label.heightAnchor.constraint(equalToConstant: 65).isActive = true
        label.topAnchor.constraint(equalTo: card.bottomAnchor, constant: 10).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    
    
}
