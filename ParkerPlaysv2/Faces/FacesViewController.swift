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
    
    // Image Picker
    var myImageView : UIImageView!
    let addImageButton = UIButton()
    
    override func viewDidLoad(){
       super.viewDidLoad()
        setupBackground()
        setupHomeButton()
        setupCard()
        setupLabel()
        setupAddImageButton()
        setupLabelButton()
//        setupTextInput()
        
        self.navigationController?.navigationBar.isHidden = true
        
        // Obtaining the Location of the Documents Directory
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

        // Create URL
        let url = documents.appendingPathComponent("image.png")

        // Convert to Data
        if let data = image.pngData() {
            do {
                try data.write(to: url)
            } catch {
                print("Unable to Write Image Data to Disk")
            }
        }
    }
        
@objc func displayImagePickerButtonTapped(_ sender: UIButton!){
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
    //where the image is coming from (library vs camera)
        myPickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
              
        self.present(myPickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
            dismiss(animated: true, completion: nil)
                        card.imageView.image = info[UIImagePickerController.InfoKey(rawValue: UIImagePickerController.InfoKey.originalImage.rawValue) ] as? UIImage
                        card.imageView.contentMode = UIView.ContentMode.scaleAspectFill
            self.dismiss(animated: true, completion: nil)
            
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
    
    func setupAddImageButton() {
        
        view.addSubview(addImageButton)
        addImageButton.backgroundColor = UIColor(red: 79/255, green: 151/255, blue: 253/255, alpha: 1)
        addImageButton.tintColor = .white
        addImageButton.setTitle("ADD PHOTOS", for: .normal)
        addImageButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        addImageButton.layer.cornerRadius = 22
        addImageButton.addTarget(self, action: #selector(playSound), for: .touchUpInside)
        addImageButton.addTarget(self, action: #selector(displayImagePickerButtonTapped), for: .touchUpInside)
        
        addImageButton.translatesAutoresizingMaskIntoConstraints = false
        addImageButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        addImageButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        addImageButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
        // this sets the button to be centered on the screen
        addImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        }
    
    @objc func playSound(){
            sound.soundFile = "buttonclick1"
            sound.playSound()
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
        homeButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        homeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func toHome(){
        sound.soundFile = "buttonclick2"
        sound.playSound()
        self.dismiss(animated: true)
    }
    
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
                    print("Text field: \(String(describing: textField?.text ?? ""))")
                    UserDefaults.standard.set(textField?.text ?? "", forKey: "faces-name")
                    //use the key to grab value data (textField?.text)
                    //to access the name: let name = UserDefaults.standard.string(forKey: "pp-name") ?? ""
        
                    self.label.updateLabelText()
                }))
        
                present(alertController, animated: true, completion: nil)
    }
}
