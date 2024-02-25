//
//  AppsSearchController.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 26.12.2023.
//

import UIKit
import SDWebImage

class AppsSearchController: BaseListController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
   
    
    fileprivate let cellID = "cellID"
    
    var appResults = [Result]()
    
    fileprivate let enterSearchTermLabel: UILabel = {
       let label = UILabel()
        label.text = "Please enter a search term above..."
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    fileprivate let activityIndicator: UIActivityIndicatorView = {
        let aI = UIActivityIndicatorView(style: .large)
        aI.hidesWhenStopped = true
        return aI
    }()
    
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.addSubview(enterSearchTermLabel)
        enterSearchTermLabel.fillSuperview(padding: .init(top: 260, left: 56, bottom: 0, right: 56))
        collectionView.addSubview(activityIndicator)
        activityIndicator.anchor(top: enterSearchTermLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 30, left: 0, bottom: 0, right: 0))
        setupSearchBar()
    }
 
    fileprivate func setupSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        appResults = []
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    
    var timer: Timer?
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        activityIndicator.startAnimating()
        
        var searchText = searchText.replacingOccurrences(of: " ", with: "+")
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
            
            Service.shared.fetchApps(searchTerm: searchText) { results, err in
                if let err = err {
                    print("Failed to get fetch results", err)
                    return
                }
                guard let results = results else {return}
                self.appResults = results.results
                
               
                DispatchQueue.main.async {
                    if searchText == "" {
                        self.activityIndicator.stopAnimating()
                        self.appResults = []
                    }
                    self.collectionView.reloadData()
                }
            }
        })
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedApp = appResults[indexPath.item]
        let appID = String(selectedApp.trackId ?? .zero)
        let detailController = AppDetailController(appID: appID)
        navigationController?.pushViewController(detailController, animated: true)
        detailController.navigationItem.title = selectedApp.trackName
        detailController.navigationItem.largeTitleDisplayMode = .never
        print(selectedApp.trackCensoredName)
    }
    
    

    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SearchResultCell
        cell.appResult = appResults[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        enterSearchTermLabel.isHidden = appResults.count != 0
        if appResults.count != 0 {
            activityIndicator.stopAnimating()
        }
        return appResults.count
    }

    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 336)
    }

}
