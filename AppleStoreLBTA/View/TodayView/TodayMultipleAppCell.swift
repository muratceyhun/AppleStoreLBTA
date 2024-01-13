//
//  TodayMultipleAppCell.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 13.01.2024.
//

import UIKit


class TodayMultipleAppCell: BaseTodayCell {
    
    
    override var todayItem: TodayItem! {
        
        didSet {
            categoryLabel.text = todayItem.category
            titleLabel.text = todayItem.title
            
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
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    let todayMultipleAppController = TodayMultipleAppController()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 16
        clipsToBounds = true
        
        addSubview(categoryLabel)
        addSubview(titleLabel)
        addSubview(todayMultipleAppController.view)
        backgroundColor = .white
        categoryLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 24, left: 24, bottom: 0, right: 24))
        titleLabel.anchor(top: categoryLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 24, bottom: 0, right: 24))
        
        todayMultipleAppController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 24, left: 24, bottom: 42, right: 24))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
