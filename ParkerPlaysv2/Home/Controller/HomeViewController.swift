//
//  ViewController.swift
//  ParkerPlaysv2
//
//  Created by Suzie  on 12/12/22.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    let helloView = HelloView()
    let gamesView = GamesView()
    let weatherView = WeatherView()
    let gamesButton = GameButton()
    var collectionView: UICollectionView?
    let peopleViewController = PeopleViewController()
    let background = UIImageView(frame: UIScreen.main.bounds)
    let settingsButton = UIButton(type: .system)
    var sound = PlaySound()

    //GAME BUTTONS
    var peekabookButton = GameButton()
    var abcButton = GameButton()
    var numbersButton = GameButton()
    var shapesButton = GameButton()
    var colorsButton = GameButton()
    var facesButton = GameButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupBackground()
        setupHelloView()
        setupWeatherView()
        setupGamesView()
//        setupSettingsButton()
//        setupPeekButton()
//        setupABC()
//        setupNumbers()
//        setupShapes()
//        setupColors()
//        setupFaces()
//        introSound()
//        setupGameCollectionView()
    }
    
    func introSound(){
        sound.soundFile = "magicsounds"
        sound.playSound()
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
    
    func setupHelloView(){
        view.addSubview(helloView)
        
        //CONSTRAINTS
        helloView.translatesAutoresizingMaskIntoConstraints = false
        helloView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        helloView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -500).isActive = true
        helloView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        helloView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
    }
    
    func setupGamesView(){
        view.addSubview(gamesView)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 0, height: 0)
        
        
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        //how to unwrap optional into variable
        guard let collectionView = collectionView else {
            return
        }
        
        collectionView.backgroundColor = .systemPink
        collectionView.register(CustomGameViewCell.self, forCellWithReuseIdentifier: "CustomGameViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
     
        gamesView.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: gamesView.topAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: gamesView.rightAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: gamesView.leftAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: gamesView.bottomAnchor).isActive = true

        //CONSTRAINTS - setup the size and constraints for gamesView
        gamesView.translatesAutoresizingMaskIntoConstraints = false
        gamesView.topAnchor.constraint(equalTo: view.topAnchor, constant: 320).isActive = true
        gamesView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
        gamesView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        gamesView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //use guard let to unwrap optional into variable
        guard let collectionView = collectionView else {
            return
        }
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
//        layout.itemSize = CGSize(width: gamesView.frame.width/2, height: gamesView.frame.height/2)
        layout.itemSize = CGSize(width: gamesView.frame.width/2, height: gamesView.frame.height/2)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomGameViewCell", for: indexPath)
        let colors: [UIColor] = [.systemPink, .systemOrange, .systemBlue, .systemRed, .black, .brown, .systemCyan, .green, .darkGray, .lightGray]
        cell.contentView.backgroundColor = colors.randomElement() ?? .green
        return cell
    }

//    func setupPeekButton(){
//        gamesView.addSubview(peekabookButton)
//        peekabookButton.setupButton(gameName: "peekaboo", iconName: "lionicon")
////        peekabookButton.addTarget(self, action: #selector(playSound), for: .touchUpInside)
//        peekabookButton.addTarget(self, action: #selector(goToPeople), for: .touchUpInside)
//
//        //CONSTRAINTS
//        peekabookButton.translatesAutoresizingMaskIntoConstraints = false
////        peekabookButton.bottomAnchor.constraint(equalTo: gamesView.top, constant: -5).isActive = true
//        peekabookButton.topAnchor.constraint(equalTo: gamesView.topAnchor, constant: 15).isActive = true
//        peekabookButton.rightAnchor.constraint(equalTo: gamesView.centerXAnchor, constant: -10).isActive = true
//    }
//
//    func setupABC(){
//        gamesView.addSubview(abcButton)
//        abcButton.setupButton(gameName: "alphabet", iconName: "abcicon")
//        abcButton.addTarget(self, action: #selector(playSound), for: .touchUpInside)
//        abcButton.addTarget(self, action: #selector(goToABC), for: .touchUpInside)
//
//        //CONSTRAINTS
//        abcButton.translatesAutoresizingMaskIntoConstraints = false
////        abcButton.bottomAnchor.constraint(equalTo: gamesView.centerYAnchor, constant: -5).isActive = true
//        abcButton.topAnchor.constraint(equalTo: gamesView.topAnchor, constant: 15).isActive = true
//        abcButton.leftAnchor.constraint(equalTo: gamesView.centerXAnchor, constant: 10).isActive = true
//    }
//
//    func setupNumbers(){
//        gamesView.addSubview(numbersButton)
//        numbersButton.setupButton(gameName: "numbers", iconName: "numbersicon")
//        numbersButton.addTarget(self, action: #selector(playSound), for: .touchUpInside)
//        numbersButton.addTarget(self, action: #selector(goToNumbers), for: .touchUpInside)
//
//        //CONSTRAINTS
//        numbersButton.translatesAutoresizingMaskIntoConstraints = false
////        numbersButton.topAnchor.constraint(equalTo: gamesView.centerYAnchor, constant: 5).isActive = true
//        numbersButton.rightAnchor.constraint(equalTo: gamesView.centerXAnchor, constant: -10).isActive = true
//        numbersButton.topAnchor.constraint(equalTo: peekabookButton.bottomAnchor, constant: 10).isActive = true
//    }
//
//    func setupShapes(){
//        gamesView.addSubview(shapesButton)
//        shapesButton.setupButton(gameName: "shapes", iconName: "shapesicon")
//        shapesButton.addTarget(self, action: #selector(playSound), for: .touchUpInside)
//        shapesButton.addTarget(self, action: #selector(goToShapes), for: .touchUpInside)
//
//        //CONSTRAINTS
//        shapesButton.translatesAutoresizingMaskIntoConstraints = false
////        shapesButton.topAnchor.constraint(equalTo: gamesView.centerYAnchor, constant: 5).isActive = true
//        shapesButton.leftAnchor.constraint(equalTo: gamesView.centerXAnchor, constant: 10).isActive = true
//        shapesButton.topAnchor.constraint(equalTo: abcButton.bottomAnchor, constant: 10).isActive = true
//    }
//
//    func setupColors(){
//        gamesView.addSubview(colorsButton)
//        colorsButton.setupButton(gameName: "colors", iconName: "rainbow3")
//        colorsButton.addTarget(self, action: #selector(goToColors), for: .touchUpInside)
//        colorsButton.addTarget(self, action: #selector(playSound), for: .touchUpInside)
//
////        CONTRAINTS
//        colorsButton.translatesAutoresizingMaskIntoConstraints = false
//        colorsButton.topAnchor.constraint(equalTo: numbersButton.bottomAnchor, constant: 10).isActive = true
//        colorsButton.rightAnchor.constraint(equalTo: gamesView.centerXAnchor, constant: -10).isActive = true
//    }
//
//    func setupFaces(){
//        gamesView.addSubview(facesButton)
//        facesButton.setupButton(gameName: "faces", iconName: "faceicon")
//        facesButton.addTarget(self, action: #selector(toSubscription), for: .touchUpInside)
//        facesButton.addTarget(self, action: #selector(playSound), for: .touchUpInside)
//
//        //CONSTRAINTS
//        facesButton.translatesAutoresizingMaskIntoConstraints = false
//        facesButton.topAnchor.constraint(equalTo: shapesButton.bottomAnchor, constant: 10).isActive = true
//        facesButton.leftAnchor.constraint(equalTo: gamesView.centerXAnchor, constant: 10).isActive = true
//    }
//
//    func setupSettingsButton(){
//        view.addSubview(settingsButton)
//        settingsButton.backgroundColor = UIColor(red: 79/255, green: 151/255, blue: 253/255, alpha: 1)
//        settingsButton.tintColor = .white
//        settingsButton.setTitle("SETTINGS", for: .normal)
//        settingsButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
//        settingsButton.layer.cornerRadius = 22
//        settingsButton.addTarget(self, action: #selector(openAlert), for: .touchUpInside)
//        settingsButton.addTarget(self, action: #selector(playSound), for: .touchUpInside)
//
//        //CONSTRAINTS
//        settingsButton.translatesAutoresizingMaskIntoConstraints = false
//        settingsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
//        settingsButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
//        settingsButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
//        // this sets the button to be centered on the screen
//        settingsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//    }
//
//    @objc func goToPeople(){
//        sound.soundFile = "Peek A - boosted"
//        sound.playSound()
//
//        let peopleVC = PeopleViewController()
//        let rootVC = peopleVC
//        let navVC = UINavigationController(rootViewController: rootVC)
//        navVC.modalPresentationStyle = .fullScreen
//        present(navVC, animated: true)
//    }
//
//    @objc func goToABC(){
//        let abcVC = ABCViewController()
//        let rootVC = abcVC
//        let navVC = UINavigationController(rootViewController: rootVC)
//        navVC.modalPresentationStyle = .fullScreen
//        present(navVC, animated: true)
//    }
//
//    @objc func goToNumbers(){
//        let numVC = NumbersViewController()
//        let rootVC = numVC
//        let navVC = UINavigationController(rootViewController: rootVC)
//        navVC.modalPresentationStyle = .fullScreen
//        present(navVC, animated: true)
//    }
//
//    @objc func goToShapes(){
//        let shapeVC = ShapesViewController()
//        let rootVC = shapeVC
//        let navVC = UINavigationController(rootViewController: rootVC)
//        navVC.modalPresentationStyle = .fullScreen
//        present(navVC, animated: true)
//    }
//
//    @objc func goToColors(){
//        let colorsVC = ColorsViewController()
//        let rootVC = colorsVC
//        let navVC = UINavigationController(rootViewController: rootVC)
//        navVC.modalPresentationStyle = .fullScreen
//        present(navVC, animated: true)
//    }
//
//    @objc func toSubscription(){
//        //pop up for option to subscribe
//        //include example of what is included in subscription
//        //StoreKit
//    }
//
//
//    @objc func openAlert(){
//        let alertController = UIAlertController(title: "Enter Name", message: "", preferredStyle: .alert)
//        alertController.addTextField { (textField) in
//            // configure the properties of the text field
//            textField.placeholder = "Name"
//        }
//
//        alertController.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (_) in
//            print("User clicked Edit button")
//        }))
//
//        alertController.addAction(UIAlertAction(title: "Save", style: .default, handler: {[weak alertController] (_) in
//            let textField = alertController?.textFields![0]
//            print("Text field: \(String(describing: textField?.text ?? ""))")
//            UserDefaults.standard.set(textField?.text ?? "", forKey: "pp-name")
//            //use the key to grab value data (textField?.text)
//            //to access the name: let name = UserDefaults.standard.string(forKey: "pp-name") ?? ""
//
//            self.helloView.updateName()
//        }))
//
//        present(alertController, animated: true, completion: nil)
//    }
//
//    @objc func playSound(){
//        sound.soundFile = "buttonclick1"
//        sound.playSound()
//    }
//
}
