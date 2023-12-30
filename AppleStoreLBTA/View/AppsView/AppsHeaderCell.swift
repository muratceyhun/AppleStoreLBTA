//
//  AppsHeaderCell.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 31.12.2023.
//

import UIKit


class AppsHeaderCell: UICollectionViewCell {
    
    let companyLabel: UILabel = {
        let label = UILabel()
        label.text = "Company Name"
        label.textColor = .blue
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Keeping up with friends is faster than ever"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 26, weight: .regular)
        return label
    }()
    
    let imageView: UIImageView = {
        let iw = UIImageView()
        iw.backgroundColor = .red
        iw.layer.cornerRadius = 12
        iw.clipsToBounds = true
        return iw
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        let verticalStackView = UIStackView(arrangedSubviews: [companyLabel, infoLabel, imageView])
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 8
        addSubview(verticalStackView)
        verticalStackView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
