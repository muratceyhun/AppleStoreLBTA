//
//  AppsHorizontalController.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 30.12.2023.
//

import UIKit


class AppsHorizontalController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    let cellID = "cellID"
    
    
    var freeApps: TopFreeApps?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(AppRowCell.self, forCellWithReuseIdentifier: cellID)
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! AppRowCell
        let freeApp = freeApps?.feed.results[indexPath.item]
        cell.appImageView.sd_setImage(with: URL(string: freeApp?.artworkUrl100 ?? ""))
        cell.appName.text = freeApp?.name
        cell.companyName.text = freeApp?.artistName
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return freeApps?.feed.results.count ?? .zero
    }
    
    let topBottomPadding: CGFloat = 12
    let lineSpacing: CGFloat = 10
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        let height = view.frame.height
        return .init(width: width - 48, height: (height - 2 * (topBottomPadding + lineSpacing)) / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 12, left: 16, bottom: 12, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    
}
