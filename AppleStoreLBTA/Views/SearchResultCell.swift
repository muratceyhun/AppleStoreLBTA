//
//  SearchResultCell.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 27.12.2023.
//

import UIKit


class SearchResultCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
       let iw = UIImageView()
        iw.backgroundColor = .black
        iw.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iw.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iw.layer.cornerRadius = 8
        
        return iw
    }()
    
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "App Name"
        return label
    }()
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Photo & Video"
        return label
    }()
    let ratingsLabel: UILabel = {
        let label = UILabel()
        label.text = "9.26M"
        return label
    }()
    
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .brown
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.layer.cornerRadius = 8
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        return button
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
        
        let vStack = UIStackView(arrangedSubviews: [nameLabel, categoryLabel, ratingsLabel])
        vStack.axis = .vertical
        vStack.backgroundColor = .gray
        let hStackView = UIStackView(arrangedSubviews: [imageView, vStack, getButton])
        hStackView.backgroundColor = .yellow
        hStackView.alignment = .center
        hStackView.spacing = 16
        addSubview(hStackView)
        hStackView.translatesAutoresizingMaskIntoConstraints = false
        hStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        hStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        hStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        hStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
