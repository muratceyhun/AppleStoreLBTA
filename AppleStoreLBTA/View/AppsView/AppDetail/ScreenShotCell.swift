//
//  ScreenShotCell.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 5.01.2024.
//

import UIKit


class ScreenShotCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iw = UIImageView()
        iw.layer.cornerRadius = 12
        iw.clipsToBounds = true
        iw.layer.borderWidth = 0.5
        iw.layer.borderColor = UIColor.lightGray.cgColor
        return iw
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        addSubview(imageView)
        imageView.fillSuperview(padding: .init(top: 16, left: 0, bottom: 16, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
