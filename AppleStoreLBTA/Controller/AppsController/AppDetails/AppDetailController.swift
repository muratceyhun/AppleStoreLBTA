//
//  AppDetailController.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 3.01.2024.
//

import UIKit
import SDWebImage


class AppDetailController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    let appDetailCellID = "appDetailCellID"
    let previewCellID = "previewCellID"
    var app: Result?
    var appID: String? {
        didSet {
            guard let appID = appID else {return}
            print("Here is app id :", appID)
            let urlString = "https://itunes.apple.com/lookup?id=\(appID)"
            Service.shared.fetchGenericJSONData(urlString: urlString) { (searchResults: SearchResult?, err) in
                if let err = err {
                    print("Failed to get selected app details", err)
                    return
                }
                print(searchResults?.results.first?.releaseNotes)
                let app = searchResults?.results.first
                self.app = app
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: appDetailCellID)
        collectionView.register(PreviewCell.self, forCellWithReuseIdentifier: previewCellID)
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: appDetailCellID, for: indexPath) as! AppDetailCell
            cell.app = self.app

            return cell
            
        } else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: previewCellID, for: indexPath) as! PreviewCell
            cell.previewScreenShotsController.app = self.app
            DispatchQueue.main.async {
                cell.previewScreenShotsController.collectionView.reloadData()
            }
            return cell
        }
        
     
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item == 0 {
            let dummyCell = AppDetailCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))
            dummyCell.app = self.app
            dummyCell.layoutIfNeeded()
            let estimatedSize = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
            return.init(width: view.frame.width - 32, height: estimatedSize.height)
        } else {
            
            return .init(width: view.frame.width, height: 600)
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 16, left: 0, bottom: 0, right: 0)
    }
    
  
    
}
