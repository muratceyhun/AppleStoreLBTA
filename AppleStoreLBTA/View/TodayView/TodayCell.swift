//
//  TodayCell.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 8.01.2024.
//

import UIKit



class TodayCell: BaseTodayCell {
    
    
    override var todayItem: TodayItem! {
        didSet {
            categoryLabel.text = todayItem.category
            titleLabel.text = todayItem.title
            imageView.image = todayItem.image
            descriptionLabel.text = todayItem.description
            self.backgroundColor = todayItem.color
        }
    }
    
    let categoryLabel: UILabel = {
       let label = UILabel()
        label.text = "LIFE HACK"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.constrainHeight(constant: 36)
        return label
    }()
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Utilizing your Time"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.numberOfLines = 0
        label.constrainHeight(constant: 44)
        return label
    }()
    
    
    let imageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "garden"))
        imageView.contentMode = .scaleAspectFill
        imageView.constrainWidth(constant: 240)
        imageView.constrainHeight(constant: 240)
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let descriptionLabel: UILabel = {
       let label = UILabel()
        label.text = "All the tools and apps you need to intelligently organize yor life the right way."
        label.numberOfLines = 3
        return label
    }()
    
    
    var topConstraint: NSLayoutConstraint!

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 16
        
        addSubview(categoryLabel)
        addSubview(titleLabel)
        addSubview(imageView)
        addSubview(descriptionLabel)
        
        topConstraint = categoryLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24)
        topConstraint.isActive = true
        
        categoryLabel.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 24, left: 24, bottom: 0, right: 24))
        titleLabel.anchor(top: categoryLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 24, bottom: 0, right: 24))
        imageView.anchor(top: titleLabel.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 12, left: 0, bottom: 0, right: 0))
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        descriptionLabel.anchor(top: imageView.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 16, left: 24, bottom: 16, right: 24))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
