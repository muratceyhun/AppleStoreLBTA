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
        label.setContentCompressionResistancePriority(.init(rawValue: 0), for: .horizontal)
        label.widthAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
        return label
    }()
    
    
    let authorName: UILabel = {
        let label = UILabel()
        label.text = "UserName"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
//        label.numberOfLines = 0
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
        label.widthAnchor.constraint(lessThanOrEqualToConstant: 150).isActive = true
        return label
    }()
    
    let starsStackView: UIStackView = {
        var arrangedSubviews = [UIView]()
        (0...4).forEach { _ in
            let iw = UIImageView(image: #imageLiteral(resourceName: "star1"))
            iw.heightAnchor.constraint(equalToConstant: 24).isActive = true
            iw.widthAnchor.constraint(equalToConstant: 24).isActive = true
            iw.contentMode = .scaleAspectFit
            arrangedSubviews.append(iw)
        }
        
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        return stackView
    }()
    
    let commentLabel: UILabel = {
        let label = UILabel()
        label.text = "klnaslasdnnadslnadskndasldaskdas klnaslasdnnadslnadskndasldaskdas klnaslasdnnadslnadskndasldaskdas klnaslasdnnadslnadskndasldaskdas"
        label.numberOfLines = 5
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 8
        backgroundColor = #colorLiteral(red: 0.9459766746, green: 0.9410116673, blue: 0.9754856229, alpha: 1)
        addSubview(commentTitle)
        commentTitle.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 16, left: 16, bottom: 0, right: 16))
        addSubview(starsStackView)
        starsStackView.anchor(top: commentTitle.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 8, left: 16, bottom: 0, right: 0))
        addSubview(commentLabel)
        commentLabel.anchor(top: starsStackView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 8, left: 16, bottom: 16, right: 16))
        
        addSubview(authorName)
        authorName.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 16))
        authorName.centerYAnchor.constraint(equalTo: commentTitle.centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
