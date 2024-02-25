//
//  MusicController.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 20.02.2024.
//

import UIKit


class MusicController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    let musicCellID = "musicCellID"
    let footerID = "footerID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(MusicCell.self, forCellWithReuseIdentifier: musicCellID)
        collectionView.register(MusicLoadingFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerID)
        fetchData()
    }
    
    var results = [Result]()
    
    fileprivate func fetchData() {
        
        let urlString = "https://itunes.apple.com/search?term=music&offset=25&limit=25"
        
        Service.shared.fetchGenericJSONData(urlString: urlString) { (searchresult: SearchResult?, err) in
            if let err = err {
                print("Failed to get itunes data", err)
                return
            }
            
            self.results = searchresult?.results ?? []
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
            
        }
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    
    var isPaginatingDone = false
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: musicCellID, for: indexPath) as! MusicCell
        let result = results[indexPath.item]
        cell.imageView.sd_setImage(with: URL(string: result.artworkUrl100 ?? ""))
        cell.musicName.text = result.trackName
        cell.artistName.text = "\(result.artistName ?? "") | \(result.collectionName ?? "")"
        
        if indexPath.item == results.count - 1 {
            
            let urlString = "https://itunes.apple.com/search?term=music&offset=\(results.count)&limit=25"
            
            Service.shared.fetchGenericJSONData(urlString: urlString) { (searchresult: SearchResult?, err) in
                if let err = err {
                    print("Failed to get itunes data", err)
                    return
                }
                
                if searchresult?.results.count == 0 {
                    self.isPaginatingDone = true
                }
                
                sleep(2)
                
                self.results += searchresult?.results ?? []
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
                
            }
            print("Load more data")
        }
        
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerID, for: indexPath)
        return footer
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 100)
    }
    
    
}
