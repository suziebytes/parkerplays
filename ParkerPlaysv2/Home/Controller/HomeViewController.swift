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
    let gamesButton = GameButton()
    let peopleViewController = PeopleViewController()
    let background = UIImageView(frame: UIScreen.main.bounds)
    let settingsButton = UIButton(type: .system)
    var sound = PlaySound()
    
    //GAME BUTTONS
    var peekabookButton = GameButton()
    var abcButton = GameButton()
    var numbersButton = GameButton()
    var shapesButton = GameButton()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupBackground()
        setupHelloView()
        setupWeatherView()
        setupGamesView()
        setupSettingsButton()
        setupPeekButton()
        setupABC()
        setupNumbers()
        setupShapes()
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
        weatherView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        weatherView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300).isActive = true
        weatherView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        weatherView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
    }
    
    func setupGamesView(){
        view.addSubview(gamesView)
        
        //CONSTRAINTS - setup the size and constraints for gamesView
        gamesView.translatesAutoresizingMaskIntoConstraints = false
        gamesView.topAnchor.constraint(equalTo: view.topAnchor, constant: 320).isActive = true
        gamesView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -165).isActive = true
        gamesView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        gamesView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
    }

    func setupPeekButton(){
        gamesView.addSubview(peekabookButton)
        peekabookButton.setupButton(gameName: "peekaboo", iconName: "lionicon")
        peekabookButton.addTarget(self, action: #selector(playSound), for: .touchUpInside)
        peekabookButton.addTarget(self, action: #selector(goToPeople), for: .touchUpInside)
        
        //CONSTRAINTS
        peekabookButton.translatesAutoresizingMaskIntoConstraints = false
        peekabookButton.bottomAnchor.constraint(equalTo: gamesView.centerYAnchor, constant: -5).isActive = true
        peekabookButton.rightAnchor.constraint(equalTo: gamesView.centerXAnchor, constant: -10).isActive = true
    }
    
    func setupABC(){
        gamesView.addSubview(abcButton)
        abcButton.setupButton(gameName: "alphabet", iconName: "abcicon")
        abcButton.addTarget(self, action: #selector(playSound), for: .touchUpInside)
        
        //CONSTRAINTS
        abcButton.translatesAutoresizingMaskIntoConstraints = false
        abcButton.bottomAnchor.constraint(equalTo: gamesView.centerYAnchor, constant: -5).isActive = true
        abcButton.leftAnchor.constraint(equalTo: gamesView.centerXAnchor, constant: 10).isActive = true
    }
    
    func setupNumbers(){
        gamesView.addSubview(numbersButton)
        numbersButton.setupButton(gameName: "numbers", iconName: "numbersicon")
        numbersButton.addTarget(self, action: #selector(playSound), for: .touchUpInside)
        
        //CONSTRAINTS
        numbersButton.translatesAutoresizingMaskIntoConstraints = false
        numbersButton.topAnchor.constraint(equalTo: gamesView.centerYAnchor, constant: 5).isActive = true
        numbersButton.rightAnchor.constraint(equalTo: gamesView.centerXAnchor, constant: -10).isActive = true
    }
    
    func setupShapes(){
        gamesView.addSubview(shapesButton)
        shapesButton.setupButton(gameName: "shapes", iconName: "shapesicon")
        shapesButton.addTarget(self, action: #selector(playSound), for: .touchUpInside)
        
        //CONSTRAINTS
        shapesButton.translatesAutoresizingMaskIntoConstraints = false
        shapesButton.topAnchor.constraint(equalTo: gamesView.centerYAnchor, constant: 5).isActive = true
        shapesButton.leftAnchor.constraint(equalTo: gamesView.centerXAnchor, constant: 10).isActive = true
    }
    
    func setupSettingsButton(){
        view.addSubview(settingsButton)
        settingsButton.backgroundColor = UIColor(red: 79/255, green: 151/255, blue: 253/255, alpha: 1)
        settingsButton.tintColor = .white
        settingsButton.setTitle("SETTINGS", for: .normal)
        settingsButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        settingsButton.layer.cornerRadius = 22
        settingsButton.addTarget(self, action: #selector(openAlert), for: .touchUpInside)
        settingsButton.addTarget(self, action: #selector(playSound), for: .touchUpInside)
        //set cornerRadius to half of height for a rounded pill button look
        
        //CONSTRAINTS
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        settingsButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        settingsButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        // this sets the button to be centered on the screen
        settingsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    }
    
    @objc func openAlert(){
        let alertController = UIAlertController(title: "Enter Name", message: "", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            // configure the properties of the text field
            textField.placeholder = "Name"
        }
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (_) in
            print("User clicked Edit button")
        }))
    
        alertController.addAction(UIAlertAction(title: "Save", style: .default, handler: {[weak alertController] (_) in
            let textField = alertController?.textFields![0]
            print("Text field: \(String(describing: textField?.text ?? ""))")
            UserDefaults.standard.set(textField?.text ?? "", forKey: "pp-name")
            //use the key to grab value data (textField?.text)
            //to access the name: let name = UserDefaults.standard.string(forKey: "pp-name") ?? ""
            
            self.helloView.updateName()
        }))
        
        present(alertController, animated: true, completion: nil)
    }
    
    @objc func goToPeople(){
        print("i am leaving somewhere else")
        self.present(peopleViewController, animated: true, completion: nil)
    }
    
    @objc func playSound(){
        sound.soundFile = "buttonclick1"
        sound.playSound()
    }
  
}
