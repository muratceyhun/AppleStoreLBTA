//
//  MultipleAppListCell.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 13.01.2024.
//

import UIKit


class MultipleAppListCell: UICollectionViewCell {
    
    var topPaidApp: AppResults! {
        didSet {
            appImage.sd_setImage(with: URL(string: topPaidApp.artworkUrl100 ?? ""))
            appName.text = topPaidApp.name
            companyName.text = topPaidApp.artistName
        }
    }
    
    
    
    let appImage: UIImageView = {
        let iw = UIImageView()
        iw.layer.cornerRadius = 8
        iw.clipsToBounds = true
        iw.layer.borderColor = UIColor(white: 0.8, alpha: 0.6).cgColor
        iw.layer.borderWidth = 0.4
        iw.constrainWidth(constant: 64)
        iw.constrainHeight(constant: 64)
        return iw
    }()
    
    
    let appName: UILabel = {
        let label = UILabel()
        label.text = "App Name"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    let companyName: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.text = "Company Name"
        return label
    }()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.1513828754, green: 0.5842013955, blue: 1, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.constrainWidth(constant: 72)
        button.constrainHeight(constant: 36)
        button.layer.cornerRadius = 18
        button.clipsToBounds = true
        button.backgroundColor = #colorLiteral(red: 0.9490196109, green: 0.9490197301, blue: 0.9490196109, alpha: 1)
        return button
    }()
    
    let sepatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        view.constrainHeight(constant: 0.5)
        return view
        
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        let stackView = UIStackView(arrangedSubviews: [appName, companyName])

        
        addSubview(appImage)
        addSubview(stackView)
        addSubview(getButton)
        addSubview(sepatorLine)
        
        appImage.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: nil)
        appImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 2
        stackView.anchor(top: nil, leading: appImage.trailingAnchor, bottom: nil, trailing: getButton.leadingAnchor, padding: .init(top: 0, left: 12, bottom: 0, right: 0))
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        sepatorLine.anchor(top: nil, leading: stackView.leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: -8, right: 0))
        
        getButton.anchor(top: nil, leading: nil, bottom: nil, trailing: trailingAnchor)
        getButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
