//
//  SearchResultCell.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 27.12.2023.
//

import UIKit


class SearchResultCell: UICollectionViewCell {
    
    
    var appResult: Result! {
        didSet {
            
            nameLabel.text = appResult?.trackCensoredName
            categoryLabel.text = appResult?.primaryGenreName
            ratingsLabel.text = String(appResult?.averageUserRating ?? .zero)
            imageView.sd_setImage(with: URL(string: appResult?.artworkUrl100 ?? ""))
            
            screenshot1ImageView.sd_setImage(with: URL(string: appResult?.screenshotUrls[0] ?? ""))
            if appResult?.screenshotUrls.count ?? .zero > 1 {
                self.screenshot2ImageView.sd_setImage(with: URL(string: self.appResult?.screenshotUrls[1] ?? ""))
            }
            
            if appResult?.screenshotUrls.count ?? .zero > 2 {
                self.screenshot3ImageView.sd_setImage(with: URL(string: self.appResult?.screenshotUrls[2] ?? ""))
            }
            
        }
    }
    
    
    
    let imageView: UIImageView = {
       let iw = UIImageView()
        iw.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iw.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iw.layer.cornerRadius = 8
        iw.clipsToBounds = true
        
        return iw
    }()
    
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "App Name"
        return label
    }()
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Photo & Video"
        return label
    }()
    let ratingsLabel: UILabel = {
        let label = UILabel()
        label.text = "9.26M"
        return label
    }()
    
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(white: 0.8, alpha: 0.3)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.layer.cornerRadius = 8
        button.widthAnchor.constraint(equalToConstant: 64).isActive = true
        button.heightAnchor.constraint(equalToConstant: 36).isActive = true
        return button
    }()
    
    
    lazy var screenshot1ImageView = self.createScreenshotImageView()
    lazy var screenshot2ImageView = self.createScreenshotImageView()
    lazy var screenshot3ImageView = self.createScreenshotImageView()

    
    
    fileprivate func createScreenshotImageView() -> UIImageView {
        
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 0.3
        return imageView
    }
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
//        let vStack = UIStackView(arrangedSubviews: [nameLabel, categoryLabel, ratingsLabel])
//        vStack.axis = .vertical
        
        let vStack = VerticalStackView(arrangedSubviews: [nameLabel, categoryLabel, ratingsLabel])
        
        let infoTapStackView = UIStackView(arrangedSubviews: [imageView, vStack, getButton])
        let screenshotsStackView = UIStackView(arrangedSubviews: [screenshot1ImageView, screenshot2ImageView, screenshot3ImageView])
        screenshotsStackView.distribution = .fillEqually
        screenshotsStackView.spacing = 12
        infoTapStackView.alignment = .center
        infoTapStackView.spacing = 12
        let overAllStackView = VerticalStackView(arrangedSubviews: [infoTapStackView, screenshotsStackView], spacing: 16)
        addSubview(overAllStackView)
        overAllStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
