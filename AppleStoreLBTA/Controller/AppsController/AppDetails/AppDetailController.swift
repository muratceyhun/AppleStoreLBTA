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
    var searchResults: SearchResult?
    var app: Result?
    var appID: String! {
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
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: appDetailCellID, for: indexPath) as! AppDetailCell
        
//        cell.appName.text = app?.trackCensoredName
        cell.appName.text = app?.trackCensoredName ?? ""
        cell.descriptionLabel.text = app?.releaseNotes ?? ""

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width - 32, height: 300)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 16, left: 0, bottom: 16, right: 0)
    }
    
  
    
}
