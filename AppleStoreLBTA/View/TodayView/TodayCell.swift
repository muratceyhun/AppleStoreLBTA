//
//  TodayCell.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 8.01.2024.
//

import UIKit



class TodayCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "garden"))
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 16
        clipsToBounds = translatesAutoresizingMaskIntoConstraints
        
        addSubview(imageView)
        imageView.centerInSuperview(size: .init(width: 200, height: 200))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
