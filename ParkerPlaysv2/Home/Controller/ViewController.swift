//
//  ViewController.swift
//  ParkerPlaysv2
//
//  Created by Suzie  on 12/12/22.
//

import UIKit



class ViewController: UIViewController {
    let games = GamesView()
    let background = UIImageView(frame: UIScreen.main.bounds)
    let gamesView = UIView()
    let playButton = UIButton()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupBackground()
        setupGamesView()
        setupPlayButton()
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
    
    func setupGamesView(){
        view.addSubview(gamesView)
        gamesView.layer.cornerRadius = 45
        gamesView.backgroundColor = .white
        gamesView.layer.shadowColor = UIColor.black.cgColor
        gamesView.layer.shadowOpacity = 0.4
        gamesView.layer.shadowOffset = CGSize(width: 0, height: 3)
        gamesView.layer.shadowRadius = 4

        //CONSTRAINTS
        gamesView.translatesAutoresizingMaskIntoConstraints = false
        gamesView.topAnchor.constraint(equalTo: view.topAnchor, constant: 375).isActive = true
        gamesView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -135).isActive = true
        gamesView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        gamesView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
    }
    
    func setupPlayButton(){
        view.addSubview(playButton)
        playButton.backgroundColor = .black
        playButton.layer.cornerRadius = 17.5
        playButton.setTitle("LET'S PLAY", for: .normal)
        
        //CONSTRAINTS
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.topAnchor.constraint(equalTo: gamesView.bottomAnchor, constant: 25).isActive = true
        playButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35).isActive = true
        playButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 75).isActive = true
        playButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -75).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        //why does corner radius need to be 1/2 of height for it to look round - is it always like this
    
    }
}



