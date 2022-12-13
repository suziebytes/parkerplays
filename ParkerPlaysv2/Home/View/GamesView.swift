//
//  Buttons.swift
//  ParkerPlaysv2
//
//  Created by Suzie  on 12/12/22.
//

import UIKit

class GamesView: UIView {
    let gamesview = UIImageView()
    
    override init(frame: CGRect) { //essentially *like* a viewDidLoad, so all function calls will be done here
        super.init(frame: frame)
//        setupGamesView()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func setupGamesView(){
//        print(" gamesview called")
//        addSubview(gamesview)
//        gamesview.layer.cornerRadius = 15
//        gamesview.backgroundColor = .white
//        
//        //CONSTRAINTS
//        gamesview.translatesAutoresizingMaskIntoConstraints = false
//        gamesview.topAnchor.constraint(equalTo: topAnchor, constant: -30).isActive = true
//        gamesview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 30).isActive = true
//        gamesview.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
//        gamesview.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
//        gamesview.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        gamesview.heightAnchor.constraint(equalToConstant: 100).isActive = true
//    }
   
    
}
