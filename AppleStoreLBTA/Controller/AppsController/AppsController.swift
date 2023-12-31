//
//  AppsController.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 30.12.2023.
//

import UIKit


class AppsController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    private let cellID = "cellID"
    private let headerID = "headerID"
    
    
    var groups = [TopFreeApps]()
    
    
    var group1: TopFreeApps?
    var group2: TopFreeApps?
    var group3: TopFreeApps?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.register(AppsHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
        fetchData()
    }
    

    
    fileprivate func fetchData() {
        
        let dispatchGroup = DispatchGroup()

            
            dispatchGroup.enter()
            Service.shared.fetchTopFreeApps { appResults, err in
                dispatchGroup.leave()
                if let err = err {
                    print("Failed to get app results", err)
                    return
                }
                self.group1 = appResults
            }
        
         
            
            dispatchGroup.enter()
            Service.shared.fetchTopMusics { appResults, err in
                dispatchGroup.leave()
                if let err = err {
                    print("Failed to get app results", err)
                    return
                }
                self.group2 = appResults
            }
        
        
        
            
            dispatchGroup.enter()
            Service.shared.fetchTopPodcasts { appResults, err in
                dispatchGroup.leave()
                if let err = err {
                    print("Failed to get app results", err)
                    return
                }
                self.group3 = appResults
            }
        
        
        dispatchGroup.notify(queue: .main) {


            if let group = self.group1 {
                self.groups.append(group)

            }
            if let group = self.group2 {
                self.groups.append(group)

            }
            if let group = self.group3 {
                self.groups.append(group)

            }
            
            self.collectionView.reloadData()
            
        }
    }
    
    
   
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath)
        return header
    }
    
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        let width: CGFloat = view.frame.width
        return .init(width: width, height: 0)
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! AppsGroupCell
        let group = groups[indexPath.item]
        cell.label.text = group.feed.title
        cell.appsHorizontalController.freeApps = group
        cell.appsHorizontalController.collectionView.reloadData()
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 16, left: 0, bottom: 0, right: 0)
    }
    
    
}
