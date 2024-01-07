//
//  ReviewHorizontalCell.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 6.01.2024.
//

import UIKit


class ReviewHorizontalCell: UICollectionViewCell {
    
    
    let commentTitle: UILabel = {
       let label = UILabel()
        label.text = "Comment Title"
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
        label.widthAnchor.constraint(lessThanOrEqualToConstant: 248).isActive = true
        return label
    }()
    
    
    let authorName: UILabel = {
       let label = UILabel()
        label.text = "UserName"
        label.numberOfLines = 0
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return label
    }()
    
    let starImageView: UIImageView = {
        let iw = UIImageView()
        iw.image = #imageLiteral(resourceName: "star1")
        iw.widthAnchor.constraint(equalToConstant: 24).isActive = true
        iw.heightAnchor.constraint(equalToConstant: 24).isActive = true

        return iw
    }()
    
    let commentLabel: UILabel = {
       let label = UILabel()
        label.text = "klnaslasdnnadslnadskndasldaskdas klnaslasdnnadslnadskndasldaskdas klnaslasdnnadslnadskndasldaskdas klnaslasdnnadslnadskndasldaskdas"
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 8
        backgroundColor = #colorLiteral(red: 0.9459766746, green: 0.9410116673, blue: 0.9754856229, alpha: 1)
        addSubview(commentTitle)
        commentTitle.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 16, left: 16, bottom: 0, right: 16))
        addSubview(starImageView)
        starImageView.anchor(top: commentTitle.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 8, left: 16, bottom: 0, right: 0))
        addSubview(commentLabel)
        commentLabel.anchor(top: starImageView.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 8, left: 16, bottom: 16, right: 16))
        
        addSubview(authorName)
        authorName.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 16))
        authorName.centerYAnchor.constraint(equalTo: commentTitle.centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
