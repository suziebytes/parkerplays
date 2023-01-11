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
    
    override func viewDidLoad() {
       super.viewDidLoad()
        setupBackground()
        setupHomeButton()
        setupCard()
        setupAddImageButton()
    }
        
    
    func setupBackground(){
        view.addSubview(background)
        background.image = UIImage(named: "gradientbg")
    }
    
    func setupHomeButton(){
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
        card.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7).isActive = true
        card.topAnchor.constraint(equalTo: homeButton.bottomAnchor).isActive = true
        card.widthAnchor.constraint(equalToConstant: 315).isActive = true
    }
    func setupAddImageButton(){
        view.addSubview(addImageButton)
        
        addImageButton.translatesAutoresizingMaskIntoConstraints = false
        addImageButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        addImageButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        addImageButton.topAnchor.constraint(equalTo: card.bottomAnchor, constant: 15).isActive = true
        // this sets the button to be centered on the screen
        addImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        }
    
    
    
}
