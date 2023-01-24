//
//  Controller.swift
//  ParkerPlaysv2
//
//  Created by Suzie on 1/11/23.
//

import UIKit

class FacesViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let background = UIImageView(frame: UIScreen.main.bounds)
    let card = CardView()
    let homeButton = HomeButton()
    var sound = PlaySound()
    let label = AnimalLabelView()
    let image = UIImage()
    let labelButton = UIButton()
    let picker = UIImagePickerController()
    let backButton = NavigationButton()
    let cameraButton = NavigationButton()
    let nextButton = NavigationButton()
    let premiumView = PremiumView()
    var id = 0
    
    // Image Picker
    var myImageView : UIImageView!
    let addImageButton = UIButton()
    
    override func viewDidLoad(){
       super.viewDidLoad()
        setupBackground()
        setupHomeButton()
        setupCard()
        setupLabel()
        setupLabelButton()
        getPersonName()
        setupBackButton()
        setupCameraButton()
        setupNextButton()
//        setupGetImage()
        setupPremium()
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        setupGetImage()
    }
    
//MARK: Premium View
    func setupPremium(){
        view.addSubview(premiumView)
        premiumView.setupPremiumView()
        premiumView.setupLogo()
        premiumView.setupHeader()
     
        premiumView.translatesAutoresizingMaskIntoConstraints = false
        premiumView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        premiumView.topAnchor.constraint(equalTo: card.topAnchor).isActive = true
        premiumView.bottomAnchor.constraint(equalTo: card.bottomAnchor).isActive = true
        premiumView.widthAnchor.constraint(equalTo: card.widthAnchor).isActive = true
        premiumView.heightAnchor.constraint(equalTo: card.heightAnchor).isActive = true
    }
    
//MARK: Navigation Buttons
    func setupBackButton(){
        view.addSubview(backButton)
        backButton.setupButton()
        backButton.setTitle("back", for: .normal)
        backButton.addTarget(self, action: #selector(previousCard), for: .touchUpInside)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        backButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
        backButton.leftAnchor.constraint(equalTo: label.leftAnchor, constant: 0).isActive = true
    }
    
    func setupCameraButton(){
        view.addSubview(cameraButton)
        cameraButton.setupButton()
        cameraButton.setTitle("cam", for: .normal)
        cameraButton.addTarget(self, action: #selector(selectSource), for: .touchUpInside)
        addImageButton.addTarget(self, action: #selector(playSound), for: .touchUpInside)

        cameraButton.translatesAutoresizingMaskIntoConstraints = false
        cameraButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        cameraButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        cameraButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cameraButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
    }
    
    func setupNextButton (){
        view.addSubview(nextButton)
        nextButton.setupButton()
        nextButton.setTitle("next", for: .normal)
        nextButton.addTarget(self, action: #selector(nextCard), for: .touchUpInside)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        nextButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
        nextButton.rightAnchor.constraint(equalTo: label.rightAnchor, constant: 0).isActive = true
    }

    @objc func playSound(){
            sound.soundFile = "buttonclick1"
            sound.playSound()
        }
    
    @objc func nextCard(){
        let faceGameViewController = FacesViewController()
        faceGameViewController.id = id+1 //self.id+1
        navigationController?.pushViewController(faceGameViewController, animated: true)
    }
    
    @objc func previousCard(){
        if id > 0 {
            navigationController?.popViewController(animated: true)
        }
    }
    
    //Alert : Select Camera or Photo Library
    @objc func selectSource(){
       picker.delegate = self
       
        let alert = UIAlertController(title: nil, message: "Take Photo or Add From Library", preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Camera", style: .default) { (result : UIAlertAction) -> Void in
          print("Camera Selected")
            self.picker.sourceType = .camera
          self.present(self.picker, animated: true, completion: nil)
        })
        alert.addAction(UIAlertAction(title: "Photo library", style: .default) { (result : UIAlertAction) -> Void in
          print("Photo Selected")
            self.picker.sourceType = .photoLibrary
          self.present(self.picker, animated: true, completion: nil)
        })

        self.present(alert, animated: true, completion: nil)
    }
    
//MARK: Setup, Store, Get Images
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey(rawValue: UIImagePickerController.InfoKey.originalImage.rawValue) ] as? UIImage
        
            card.imageView.contentMode = UIView.ContentMode.scaleAspectFill
        card.imageView.image = image
        storeImage(image: image)
            self.dismiss(animated: true, completion: nil)
    }
    
    func storeImage(image: UIImage?){
        // Obtaining the Location of the Documents Directory
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        // Create URL
        let url = documents.appendingPathComponent("\(id)image.png")
        print("this is image path \(url)")

        // Convert to Data - grabbing image converting to UIImage
        if let data = image?.pngData() {
            do {
                try data.write(to: url)
            } catch {
                print("Unable to Write Image Data to Disk")
            }
        }
    }
    
    func setupGetImage(){
//        //grab image store in documents foler
//        //access url path for image in documents
//        //assign image to UIImageView of cardView
//        let imageName = "\(id)-image.png"
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let url = documents.appendingPathComponent("\(id)image.png")
        
        if let imageData = try? Data(contentsOf: url) {
            card.imageView.image = UIImage(data: imageData)
        }
    }
    
     override func didReceiveMemoryWarning() {
         super.didReceiveMemoryWarning()
         // Dispose of any resources that can be recreated.
     }
    
// MARK: - Setup, Store, Get Label Name
    func setupLabel(){
        view.addSubview(label)
        //CONSTRAINTS
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 315).isActive =  true
        label.heightAnchor.constraint(equalToConstant: 65).isActive = true
        label.topAnchor.constraint(equalTo: card.bottomAnchor, constant: 10).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupLabelButton(){
        label.addSubview(labelButton)
        labelButton.addTarget(self, action: #selector(updateText), for: .touchUpInside)
        //CONSTRAINTS
        labelButton.translatesAutoresizingMaskIntoConstraints = false
        labelButton.widthAnchor.constraint(equalTo: label.widthAnchor).isActive = true
        labelButton.heightAnchor.constraint(equalTo: label.heightAnchor).isActive = true
    }
    
    func storePersonName(name: String) {
        UserDefaults.standard.set(name, forKey: "\(id)-person-name")
    }

    func getPersonName() {
        let name = UserDefaults.standard.string(forKey: "\(id)-person-name")
//        labelButton.setTitle(name, for: .normal)
        label.animalLabel.text = name
    }

    @objc func updateText(){
        let alertController = UIAlertController(title: "Enter a name", message: nil, preferredStyle: .alert)
        alertController.addTextField()

        let saveAction = UIAlertAction(title: "Save", style: .default, handler: { action in
            let name = alertController.textFields?[0].text ?? "no-name-entered"

            // Set name to button title
            self.label.animalLabel.text = name

            // Store name in user defaults
            self.storePersonName(name: name)
            
        })

        alertController.addAction(saveAction)
        present(alertController, animated: true)
    }
    
//MARK: General Setup of bg, card, home button, etc
    func setupCard(){
        view.addSubview(card)
        card.setupImage()
        //CONSTRAINT
        card.translatesAutoresizingMaskIntoConstraints = false
        card.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        card.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.65).isActive = true
        card.topAnchor.constraint(equalTo: homeButton.bottomAnchor).isActive = true
        card.widthAnchor.constraint(equalToConstant: 315).isActive = true
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
        homeButton.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        homeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        homeButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        homeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func toHome(){
        sound.soundFile = "buttonclick2"
        sound.playSound()
        self.dismiss(animated: true)
    }
}
