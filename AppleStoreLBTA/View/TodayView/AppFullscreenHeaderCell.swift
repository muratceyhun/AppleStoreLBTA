//
//  AppFullscreenHeaderCell.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 9.01.2024.
//

import UIKit


class AppFullscreenHeaderCell: UITableViewCell {
        
    
    let todayCell = TodayCell()
    
    
  
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(todayCell)
//        addSubview(closeButton)
        todayCell.fillSuperview()
//        closeButton.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 88, left: 0, bottom: 0, right: 16))
        sendSubviewToBack(contentView)   // Or you can use contentView.addSubview(closeButton) ;)
        clipsToBounds = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
