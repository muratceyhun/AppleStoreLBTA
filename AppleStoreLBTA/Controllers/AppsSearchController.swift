//
//  AppsSearchController.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 26.12.2023.
//

import UIKit

class AppsSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
   
    
    fileprivate let cellID = "cellID"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellID)
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 336)
    }
    
    
   
    
    init() {
        let flowLayout = UICollectionViewFlowLayout()
//        let layout = UICollectionViewLayout()
        super.init(collectionViewLayout: flowLayout)
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
