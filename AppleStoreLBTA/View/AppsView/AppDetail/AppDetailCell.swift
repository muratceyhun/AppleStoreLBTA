//
//  AppDetailCell.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 4.01.2024.
//

import UIKit



class AppDetailCell: UICollectionViewCell {
    
    
    var app: Result! {
        didSet {
            
            appImageView.sd_setImage(with: URL(string: app.artworkUrl512 ?? ""))
            appName.text = app.trackCensoredName
            priceButton.setTitle(app.formattedPrice, for: .normal)
            descriptionLabel.text = app.releaseNotes
            
        }
    }
    
    
    
    let appImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let appName: UILabel = {
        let appName = UILabel()
        appName.text = "App Name"
        appName.textColor = .black
        appName.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return appName
    }()
    
    let whatsNewLabel: UILabel = {
        let label = UILabel()
        label.text = "What's New"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return label
    }()
    
    let priceButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.backgroundColor = #colorLiteral(red: 0.1772835851, green: 0.4331347942, blue: 0.9626222253, alpha: 1)
        button.widthAnchor.constraint(equalToConstant: 88).isActive = true
        button.heightAnchor.constraint(equalToConstant: 36).isActive = true
        button.layer.cornerRadius = 18
        button.clipsToBounds = true
        
        return button
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "dsakdajsjldasnldasnljdsanklnkdlasnkldasnkldasnkdsnnads dsakdajsjldasnldasnljdsanklnkdlasnkldasnkldasnkdsnnads dsakdajsjldasnldasnljdsanklnkdlasnkldasnkldasnkdsnnads"
        label.numberOfLines = 0
        label.backgroundColor = .yellow
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        addSubview(appImageView)
        appImageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil)
        addSubview(appName)
        appName.anchor(top: topAnchor, leading: appImageView.trailingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 12, bottom: 0, right: 0))
        addSubview(priceButton)
        priceButton.anchor(top: nil, leading: appImageView.trailingAnchor, bottom: appImageView.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 12, bottom: 0, right: 0))
        addSubview(whatsNewLabel)
        whatsNewLabel.anchor(top: appImageView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil)
        addSubview(descriptionLabel)
        descriptionLabel.anchor(top: whatsNewLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 10, right: 0))
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
