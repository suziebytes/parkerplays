//
//  CustomGameViewCell.swift
//  ParkerPlaysv2
//
//  Created by Suzie on 12/26/22.
//

import UIKit

class CustomGameViewCell: UICollectionViewCell {
    static let identifier = "CustomGameViewCell"
    var image = UIImageView()
    var label = UILabel()
    var container = UIView()
    var imageName = ""
    var titleName = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(){
//        contentView.backgroundColor = .red
        contentView.addSubview(container)
        contentView.addSubview(image)
        contentView.addSubview(label)
       
        container.backgroundColor = .white
        container.layer.cornerRadius = 15
        container.layer.cornerRadius = 15
        container.layer.shadowColor = UIColor.black.cgColor
        container.layer.shadowOpacity = 0.4
        container.layer.shadowOffset = CGSize(width: 0, height: 3)
        container.layer.shadowRadius = 4
                
        //CONSTRANTS
        container.translatesAutoresizingMaskIntoConstraints = false
        container.heightAnchor.constraint(equalToConstant: 125).isActive = true
        container.widthAnchor.constraint(equalToConstant: 125).isActive = true
        container.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        container.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: container.topAnchor, constant: 10).isActive = true
        image.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -30).isActive = true
        image.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -10).isActive = true
        image.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 10).isActive = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 5).isActive = true
        label.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
    }
    
    func configureCell(named: String, titleName: String){
        image.image = UIImage(named: named)
        image.contentMode = .scaleAspectFit
        label.text = titleName.uppercased()
        label.textColor = UIColor(red: 97/255, green: 97/255, blue: 97/255, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 15)
    }
}


//NOTES - cells have contentviews (mandatory for their Views). UIViews you can just add background and everything on it.
