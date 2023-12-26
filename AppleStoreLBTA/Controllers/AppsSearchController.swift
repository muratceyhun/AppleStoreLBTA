//
//  AppsSearchController.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 26.12.2023.
//

import UIKit

class AppsSearchController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .brown
    }
    
    
    init() {
        let flowLayout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: flowLayout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
