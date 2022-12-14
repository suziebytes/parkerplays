//
//  HelloView.swift
//  ParkerPlaysv2
//
//  Created by Suzie  on 12/13/22.
//

import UIKit
 
class HelloView: UIView {
    let helloLabel = UILabel()
    let nameLabel = UILabel()

    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupHello()
        setupNameLabel()
        updateName()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupHello(){
        addSubview(helloLabel)
        helloLabel.text = "Hello"
        helloLabel.textColor = .white
        helloLabel.font = UIFont.systemFont(ofSize: 50, weight: .light)
    
        
        //CONSTRAINTS
        helloLabel.translatesAutoresizingMaskIntoConstraints = false
        helloLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        //centers text
        helloLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
      
    }
    
    func setupNameLabel(){
        addSubview(nameLabel)
        nameLabel.text = "Landon"
        nameLabel.textColor = .white
        nameLabel.font = UIFont.systemFont(ofSize: 50, weight: .medium)
        nameLabel.textDropShadow()

        //CONSTRAINTS
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: 5).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    func updateName(){
        let name = UserDefaults.standard.string(forKey: "pp-name") ?? ""
        nameLabel.text = name
        
    }
}

extension UILabel {
    func textDropShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 1, height: 2)
    }

    static func createCustomLabel() -> UILabel {
        let label = UILabel()
        label.textDropShadow()
        return label
    }
}
