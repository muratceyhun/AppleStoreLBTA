//
//  AppRowCell.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 30.12.2023.
//

import UIKit

class AppRowCell: UICollectionViewCell {
    
//    var topFreeApp: TopFreeApps! {
//        didSet {
//            appImageView.sd_setImage(with: URL(string: topFreeApp.feed.results.first?.artworkUrl100 ?? ""))
//            appName.text = topFreeApp.feed.results.first?.name
//            companyName.text = topFreeApp.feed.results.first?.artistName
//        }
//    }
    
    let appImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .purple
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        return imageView
    }()
    
    
    let appName: UILabel = {
        let label = UILabel()
        label.text = "App Name"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.widthAnchor.constraint(lessThanOrEqualToConstant: 220).isActive = true
        return label
    }()
    
    
    let companyName: UILabel = {
        let label = UILabel()
        label.text = "Company Name"
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .lightGray
        label.widthAnchor.constraint(lessThanOrEqualToConstant: 220).isActive = true
        return label
    }()
    
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = UIColor(white: 0.7, alpha: 0.6)
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        button.widthAnchor.constraint(equalToConstant: 56).isActive = true
        button.heightAnchor.constraint(equalToConstant: 24).isActive = true
        return button
    }()
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        let labelStackView = UIStackView(arrangedSubviews: [appName, companyName])
        labelStackView.alignment = .leading
        labelStackView.axis = .vertical
        labelStackView.spacing = 4
        
        addSubview(appImageView)
        appImageView.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 8, bottom: 0, right: 0))
        appImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        addSubview(labelStackView)
        labelStackView.anchor(top: nil, leading: appImageView.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 12, bottom: 0, right: 0))
        labelStackView.centerYAnchor.constraint(equalTo: appImageView.centerYAnchor).isActive = true
        addSubview(getButton)
        getButton.anchor(top: nil, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 12))
        getButton.centerYAnchor.constraint(equalTo: labelStackView.centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
