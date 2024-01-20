//
//  BaseTodayCell.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 13.01.2024.
//

import UIKit

class BaseTodayCell: UICollectionViewCell {
    
    
    var todayItem: TodayItem!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.shadowOpacity = 0.1
            layer.shadowRadius = 10
            layer.shadowOffset = .init(width: 0, height: 10)
            layer.shadowPath = UIBezierPath(rect: layer.bounds).cgPath
            layer.rasterizationScale = UIScreen.main.scale // you should make sure iOS caches the shadow at the same drawing scale as the main screen, otherwise it look pixelated
            layer.shouldRasterize = true
        
    }
    
    override var isHighlighted: Bool {
        
        didSet {
            if isHighlighted {
                print("is highlighted:", isHighlighted)
                
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5) {
                    self.transform = .init(scaleX: 1.1, y: 1.1)
                }
                
            } else {
                print("is highlighted:", isHighlighted)

                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5) {
                    self.transform = .identity
                }
                
            }
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
