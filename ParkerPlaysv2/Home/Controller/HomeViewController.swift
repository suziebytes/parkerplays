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
    let pageControl = UIPageControl()
    
    //GAME BUTTONS
    var peekabookButton = GameButton()
    var abcButton = GameButton()
    var numbersButton = GameButton()
    var shapesButton = GameButton()
    var colorsButton = GameButton()
    var facesButton = GameButton()
    
    //COLLECTIONVIEW
    var array = ["peekaboo", "numbers", "abc", "shapes", "colors","opposites", "feelings", "faces"]
    var imgArray = ["lionicon", "numbersicon", "abcicon", "shapesicon", "crayon2", "oppositeicon", "feelingsicon", "faceicon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupBackground()
        setupHelloView()
        setupWeatherView()
        setupGamesView()
        setupSettingsButton()
//        introSound()
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
    
    func setupHelloView(){
        view.addSubview(helloView)
        
        //CONSTRAINTS
        helloView.translatesAutoresizingMaskIntoConstraints = false
        helloView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
//        helloView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -500).isActive = true
        helloView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        helloView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        helloView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
    }
    func setupWeatherView(){
        view.addSubview(weatherView)
        weatherView.backgroundColor = .clear
        
        //CONSTRAINTS
        weatherView.translatesAutoresizingMaskIntoConstraints = false
        weatherView.topAnchor.constraint(equalTo: helloView.bottomAnchor).isActive = true
//        weatherView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300).isActive = true
        weatherView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        weatherView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        weatherView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(self.collectionView!.contentOffset.x)
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
    
        collectionView.register(CustomGameViewCell.self, forCellWithReuseIdentifier: "CustomGameViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        
        gamesView.addSubview(collectionView)
        
        // CONSTRAINTS
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: gamesView.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: gamesView.bottomAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: gamesView.rightAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: gamesView.leftAnchor).isActive = true
      
        gamesView.translatesAutoresizingMaskIntoConstraints = false
        gamesView.topAnchor.constraint(equalTo: weatherView.bottomAnchor).isActive = true
        gamesView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.45).isActive = true
        gamesView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        gamesView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
//        gamesView.heightAnchor.constraint(equalToConstant: 370).isActive = true
        
        gamesView.addSubview(pageControl)
        pageControl.numberOfPages = 2
        pageControl.currentPage = array.count/4
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .gray
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.topAnchor.constraint(equalTo: gamesView.bottomAnchor, constant: -15).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: gamesView.bottomAnchor).isActive = true
        pageControl.leftAnchor.constraint(equalTo: gamesView.leftAnchor).isActive = true
        pageControl.rightAnchor.constraint(equalTo: gamesView.rightAnchor).isActive = true
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
        return array.count
        
    }
    
    //creates the cell and  applies the ui design
    //indexpath = index
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //IndexPath is an object, so to retreive the actual  index we access the .row - indexPath.row is a property that will provide the index -> Int (#)
        //identifier (class customgameview) is where all the design will be and it is populated using dequeue - essentially a view
        //ALWAYS needs to be casted to your own customgameviewcell (inherits from UICollectionCell
        //to cast - if let ; guard let*
        //        guard let customCell = cell as? CustomGameViewCell else {
        //            return cell
        //        }
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomGameViewCell", for: indexPath) as? CustomGameViewCell {
            
            let titleName = array[indexPath.row]
            let imageName = imgArray[indexPath.row]
            cell.configureCell(named: imageName, titleName: titleName)
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    //function called when cell is selected - indexPath tells you which cell was tapped
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        let game = array[indexPath.row]
        switch game {
        case "peekaboo":
            sound.soundFile = "Peek A - boosted"
            sound.playSound()
            
            let peopleVC = PeopleViewController()
            let rootVC = peopleVC
            let navVC = UINavigationController(rootViewController: rootVC)
            navVC.modalPresentationStyle = .fullScreen
            present(navVC, animated: true)
            
        case "numbers":
            let numVC = NumbersViewController()
            let rootVC = numVC
            let navVC = UINavigationController(rootViewController: rootVC)
            navVC.modalPresentationStyle = .fullScreen
            present(navVC, animated: true)
            
        case "abc":
            sound.soundFile = "buttonclick1"
            sound.playSound()
            
            let abcVC = ABCViewController()
            let rootVC = abcVC
            let navVC = UINavigationController(rootViewController: rootVC)
            navVC.modalPresentationStyle = .fullScreen
            present(navVC, animated: true)
            
        case "shapes":
            sound.soundFile = "buttonclick1"
            sound.playSound()
            
            let shapeVC = ShapesViewController()
            let rootVC = shapeVC
            let navVC = UINavigationController(rootViewController: rootVC)
            navVC.modalPresentationStyle = .fullScreen
            present(navVC, animated: true)
            
        case "colors":
            sound.soundFile = "buttonclick1"
            sound.playSound()
            
            let colorsVC = ColorsViewController()
            let rootVC = colorsVC
            let navVC = UINavigationController(rootViewController: rootVC)
            navVC.modalPresentationStyle = .fullScreen
            present(navVC, animated: true)
            
        default:
            break
        }
    }
    
   
    
//    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//        let scrollPos = scrollView.contentOffset.x / view.frame.width
//        pageControl.currentPage = Int(scrollPos)
//    }
 
        
    
        
    func setupSettingsButton(){
        view.addSubview(settingsButton)
        settingsButton.backgroundColor = UIColor(red: 79/255, green: 151/255, blue: 253/255, alpha: 1)
        settingsButton.tintColor = .white
        settingsButton.setTitle("SETTINGS", for: .normal)
        settingsButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        settingsButton.layer.cornerRadius = 22
        settingsButton.addTarget(self, action: #selector(openAlert), for: .touchUpInside)
        settingsButton.addTarget(self, action: #selector(playSound), for: .touchUpInside)
        
        //CONSTRAINTS
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        settingsButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        settingsButton.topAnchor.constraint(equalTo: gamesView.bottomAnchor, constant: 15).isActive = true
        // this sets the button to be centered on the screen
        settingsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        }
        
       
        //    @objc func toSubscription(){
        //        //pop up for option to subscribe
        //        //include example of what is included in subscription
        //        //StoreKit
        //    }
    
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
        
            @objc func playSound(){
                sound.soundFile = "buttonclick1"
                sound.playSound()
            }
        
    }

