//
//  Buttons.swift
//  ParkerPlaysv2
//
//  Created by Suzie  on 12/12/22.
//

import UIKit

class GamesView: UIView {
    let playButton = UIButton()

    
    override init(frame: CGRect) { //essentially *like* a viewDidLoad, so all function calls will be done here
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
//        addSubview(gamesview)
        backgroundColor = .white
        
        layer.cornerRadius = 45
        backgroundColor = .white
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowRadius = 4
    }
}
   

