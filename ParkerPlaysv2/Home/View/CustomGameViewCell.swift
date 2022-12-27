//
//  CustomGameViewCell.swift
//  ParkerPlaysv2
//
//  Created by Suzie on 12/26/22.
//

import UIKit

class CustomGameViewCell: UICollectionViewCell {
    static let identifier = "CustomGameViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
