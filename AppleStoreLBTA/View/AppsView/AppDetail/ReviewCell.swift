//
//  ReviewCell.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 6.01.2024.
//

import UIKit

class ReviewCell: UICollectionViewCell {
    
    let reviewLabel: UILabel = {
        let label = UILabel()
        label.text = "Reviews & Ratings"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    
    let reviewController = ReviewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        addSubview(reviewLabel)
        reviewLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 0))
        addSubview(reviewController.view)
        reviewController.view.anchor(top: reviewLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor ,padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
}
