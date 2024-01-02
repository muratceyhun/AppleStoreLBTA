//
//  AppsHeaderHorizontalController.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 31.12.2023.
//

import UIKit


class AppsHeaderHorizontalController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {
    
    let cellID = "cellID"
    
    var headerResults = [HeaderModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(AppsHeaderCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.decelerationRate = .fast
        collectionView.contentInset = .init(top: 16, left: 16, bottom: 16, right: 16)
      
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! AppsHeaderCell
        let headerResult = headerResults[indexPath.item]
        cell.headerResult = headerResult
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return headerResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width-48, height: view.frame.height)
    }
    
    
}
