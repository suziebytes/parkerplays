//
//  GameButtons.swift
//  ParkerPlaysv2
//
//  Created by Suzie  on 12/14/22.
//

import UIKit

class GameButton: UIButton {
    var title = UILabel()
    var icon = UIImageView()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton() {
        //full button styling + drop shadow
        backgroundColor = .white
        layer.cornerRadius = 15
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowRadius = 4
        
        //adding labels and icon to button
        addSubview(title)
        addSubview(icon)
        // label + button styling
        title.text = "Peekaboo".uppercased()
        title.textColor = UIColor(red: 97/255, green: 97/255, blue: 97/255, alpha: 1)
        title.font = UIFont.boldSystemFont(ofSize: 15)
        icon.image = UIImage(named: "lionicon")
        
        //CONSTRAINTS to create height and width of button (white) (not against the view)
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 130).isActive = true
        widthAnchor.constraint(equalToConstant: 130).isActive = true
        
        //CONSTRAINT of Label
        title.translatesAutoresizingMaskIntoConstraints = false
        title.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        title.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        //CONSTRAINT of Icon
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.bottomAnchor.constraint(equalTo: title.topAnchor, constant: -10).isActive = true
        icon.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 80).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 80).isActive = true

        

    }
}
