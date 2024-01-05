//
//  PreviewScreenShotsController.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 5.01.2024.
//

import UIKit


class PreviewScreenShotsController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {
    
    
    let screenShotCellID = "screenShotCellID"
    
    var app: Result?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(ScreenShotCell.self, forCellWithReuseIdentifier: screenShotCellID)
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return app?.screenshotUrls.count ?? .zero
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: screenShotCellID, for: indexPath) as! ScreenShotCell
        cell.imageView.sd_setImage(with: URL(string: app?.screenshotUrls[indexPath.item] ?? ""))
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: 256, height: view.frame.height)
    }
    
}
