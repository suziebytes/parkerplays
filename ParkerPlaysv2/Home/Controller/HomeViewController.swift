//
//  ViewController.swift
//  ParkerPlaysv2
//
//  Created by Suzie  on 12/12/22.
//

import UIKit



class HomeViewController: UIViewController {
    let helloView = HelloView()
    let gamesView = GamesView()
    let weatherView = WeatherView()
    let background = UIImageView(frame: UIScreen.main.bounds)
    let playButton = UIButton()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupBackground()
        setupHelloView()
        setupWeatherView()
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
    
    func setupHelloView(){
        view.addSubview(helloView)
//        helloView.backgroundColor = .purple
        
        //CONSTRAINTS
        helloView.translatesAutoresizingMaskIntoConstraints = false
        helloView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        helloView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -500).isActive = true
        helloView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        helloView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        
    }
    
    func setupWeatherView(){
        view.addSubview(weatherView)
        weatherView.backgroundColor = .clear
    

        //CONSTRAINTS
        weatherView.translatesAutoresizingMaskIntoConstraints = false
        weatherView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        weatherView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300).isActive = true
        weatherView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        weatherView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
    }
    
    
    func setupGamesView(){
        view.addSubview(gamesView)
        
        //CONSTRAINTS
        gamesView.translatesAutoresizingMaskIntoConstraints = false
        gamesView.topAnchor.constraint(equalTo: view.topAnchor, constant: 375).isActive = true
        gamesView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -135).isActive = true
        gamesView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        gamesView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
    }
    
    func setupPlayButton(){
        view.addSubview(playButton)
        playButton.backgroundColor = UIColor(red: 79/255, green: 151/255, blue: 253/255, alpha: 1)
        playButton.setTitle("LET'S PLAY", for: .normal)
        playButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        playButton.layer.cornerRadius = 25
        playButton.addTarget(self, action: #selector(openAlert), for: .touchUpInside)
        //set cornerRadius to half of height for a rounded pill button look
        
        //CONSTRAINTS
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        playButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        // this sets the button to be centered on the screen
        playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    }
    
    @objc func openAlert(){
        let alertController = UIAlertController(title: "Enter Name", message: "", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            // configure the properties of the text field
            textField.placeholder = "Name"
        }
        present(alertController, animated: true, completion: nil)
        
    }
}
