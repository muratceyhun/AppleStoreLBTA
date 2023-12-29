//
//  AppsSearchController.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 26.12.2023.
//

import UIKit

class AppsSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
   
    
    fileprivate let cellID = "cellID"
    
    
    var appResults = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellID)
        Service.shared.fetchApps { results, err in
            if let err = err {
                print("Failed to get fetch results", err)
                return
            }
            
            self.appResults = results
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
        
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SearchResultCell
        cell.nameLabel.text = "App Name"
        let result = appResults[indexPath.item]
        cell.nameLabel.text = result.trackCensoredName
        cell.categoryLabel.text = result.primaryGenreName
        cell.ratingsLabel.text = String(result.averageUserRating ?? .zero)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appResults.count
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
