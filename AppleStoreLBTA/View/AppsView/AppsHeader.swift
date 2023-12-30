//
//  AppsHeader.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 30.12.2023.
//

import UIKit

class AppsHeader: UICollectionReusableView {
    
    let headerCell = AppsHeaderHorizontalController()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        addSubview(headerCell.view)
        headerCell.view.fillSuperview()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
