//
//  MusicLoadingFooter.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 20.02.2024.
//

import UIKit


class MusicLoadingFooter: UICollectionReusableView {
    
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Loading more..."
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.startAnimating()
        
        let stackView = UIStackView(arrangedSubviews: [aiv, label])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 8, left: 0, bottom: 8, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
