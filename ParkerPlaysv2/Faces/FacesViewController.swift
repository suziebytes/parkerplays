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
    let id: Int
    
    init(id: Int) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
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
//        setupTextInput()
        setupBackButton()
        setupCameraButton()
        setupNextButton()
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: Navigation Buttons
    func setupBackButton(){
        view.addSubview(backButton)
        backButton.setupButton()
        backButton.setTitle("back", for: .normal)
        
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
        cameraButton.addTarget(self, action: #selector(addImageButtonTapped), for: .touchUpInside)
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
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        nextButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
        nextButton.rightAnchor.constraint(equalTo: label.rightAnchor, constant: 0).isActive = true
    }
    
    @objc func addImageButtonTapped(_ sender: UIButton!){
            let pickerController = UIImagePickerController()
            pickerController.delegate = self
        //where the image is coming from (library vs camera)
        pickerController.sourceType = .photoLibrary
            self.present(pickerController, animated: true, completion: nil)
        }
    
    @objc func playSound(){
            sound.soundFile = "buttonclick1"
            sound.playSound()
        }
    
    //MARK: Setup Image Picker
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            card.imageView.image = info[UIImagePickerController.InfoKey(rawValue: UIImagePickerController.InfoKey.originalImage.rawValue) ] as? UIImage
            card.imageView.contentMode = UIView.ContentMode.scaleAspectFill
        storeImage(info: info)
            self.dismiss(animated: true, completion: nil)
    }
    
    func storeImage(info: [UIImagePickerController.InfoKey : Any]){
        // Obtaining the Location of the Documents Directory
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        // Create URL
        let url = documents.appendingPathComponent("image.png")
        print("this is image path \(url)")

        // Convert to Data - grabbing image converting to UIImage
        let image = info[UIImagePickerController.InfoKey(rawValue: UIImagePickerController.InfoKey.originalImage.rawValue) ] as? UIImage
        if let data = image?.pngData() {
            do {
                try data.write(to: url)
            } catch {
                print("Unable to Write Image Data to Disk")
            }
        }
    }
    
    func setupGetImage(){
//        CardView.imageView.image = url
//        //grab image store in documents foler
//        //access url path for image in documents
//        //assign image to UIImageView of cardView
    }
        
     override func didReceiveMemoryWarning() {
         super.didReceiveMemoryWarning()
         // Dispose of any resources that can be recreated.
     }
    
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
        labelButton.setTitle(name, for: .normal)
    }
    
    @objc func updateText(){
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
                    let name = alertController?.textFields![0].text ?? "no-name-entered"
                    print("Text field: \(String(describing: textField?.text ?? ""))")
                    UserDefaults.standard.set(textField?.text ?? "", forKey: "faces-name")
                    //use the key to grab value data (textField?.text)
                    //to access the name: let name = UserDefaults.standard.string(forKey: "pp-name") ?? ""
        
                    self.label.updateLabelText()
                    self.storePersonName(name: name)
                }))
        
                present(alertController, animated: true, completion: nil)
    }
}
