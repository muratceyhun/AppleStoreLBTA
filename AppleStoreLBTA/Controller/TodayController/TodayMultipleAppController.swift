//
//  TodayMultipleAppController.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 13.01.2024.
//

import UIKit


class TodayMultipleAppController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {
    
    var topPaidApps: TopFreeApps?
    
    
    let multipleAppListCellID = "multipleAppListCellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        collectionView.register(MultipleAppListCell.self, forCellWithReuseIdentifier: multipleAppListCellID)
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        fetchItems()
      
    }
    
    fileprivate func fetchItems() {
        Service.shared.fetchTopPaidApps { topPaidApps, err in
            if let err = err {
                print("Failed to get top paid apps", err)
            }
            self.topPaidApps = topPaidApps
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topPaidApps?.feed.results.count ?? .zero
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: multipleAppListCellID, for: indexPath) as! MultipleAppListCell
        let topPaidApp = self.topPaidApps?.feed.results[indexPath.item]
        cell.topPaidApp = topPaidApp
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = (view.frame.height - 3 * spacing) / 4
        return .init(width: view.frame.width, height: height)
    }
    
    let spacing: CGFloat = 16
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    
    
}
