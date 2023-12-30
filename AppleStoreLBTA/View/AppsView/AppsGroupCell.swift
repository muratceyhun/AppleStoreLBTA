//
//  AppsGroupCell.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 30.12.2023.
//

import UIKit


class AppsGroupCell: UICollectionViewCell {
    
    
    let appsHorizontalController = AppsHorizontalController()

    
    let label: UILabel = {
        let label = UILabel()
        label.text = "App Section"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        addSubview(label)
        addSubview(appsHorizontalController.view)
        label.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil)
        appsHorizontalController.view.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
