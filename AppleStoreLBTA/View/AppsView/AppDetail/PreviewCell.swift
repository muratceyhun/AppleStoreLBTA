//
//  PreviewCell.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 5.01.2024.
//

import UIKit


class PreviewCell: UICollectionViewCell {
    
    
    let previewScreenShotsController = PreviewScreenShotsController()
    
    
    
    
    let previewLabel: UILabel = {
        let label = UILabel()
        label.text = "Preview"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(previewLabel)
        previewLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 0))
        addSubview(previewScreenShotsController.view)
        previewScreenShotsController.view.anchor(top: previewLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
