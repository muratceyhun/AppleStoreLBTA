//
//  MusicCell.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 20.02.2024.
//

import UIKit


class MusicCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iw = UIImageView()
        iw.backgroundColor = .black
        iw.constrainHeight(constant: 76)
        iw.constrainWidth(constant: 76)
        iw.layer.cornerRadius = 8
        iw.clipsToBounds = true
        return iw
    }()
    
    let musicName: UILabel = {
        let label = UILabel()
        label.text = "Music Name"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    let artistName: UILabel = {
        let label = UILabel()
        label.text = "Taylor Swift"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    
    let seperatorLine: UIView = {
        let line = UIView()
        line.constrainHeight(constant: 0.4)
        line.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return line
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let verticalStackView = UIStackView(arrangedSubviews: [musicName, artistName])
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 4
        verticalStackView.distribution = .fillProportionally
        let stackView = UIStackView(arrangedSubviews: [imageView, verticalStackView])
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.distribution = .fillProportionally
        addSubview(stackView)
        stackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 16, left: 16, bottom: 16, right: 16))
        addSubview(seperatorLine)
        seperatorLine.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
