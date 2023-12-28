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
        fetchResults()
    }
    
    
    fileprivate func fetchResults() {
        
        let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
        
        guard let url = URL(string: urlString) else {return}
        
        
        URLSession.shared.dataTask(with: url) { data, response, err in
            
            if let err = err {
                print("Failed to fetch data", err)
            }
            
//            print(data)
//            print(String(data: data ?? Data(), encoding: .utf8))
            
            guard let data = data else {return}
            
            do {
                
               let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                print("*******")
                
                searchResult.results.forEach{print($0.trackCensoredName, "|", $0.primaryGenreName)}
                
            } catch let err {
                print("Failed to decode data", err)
            }
            
        }.resume()
        
        
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SearchResultCell
        cell.nameLabel.text = "App Name"
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
