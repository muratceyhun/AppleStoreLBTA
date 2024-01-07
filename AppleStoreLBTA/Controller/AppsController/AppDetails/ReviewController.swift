//
//  ReviewController.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 6.01.2024.
//

import UIKit


class ReviewController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {
    
    
    let reviewHorizontalCellID = "reviewHorizontalCellID"
    
    var reviewResults: Reviews?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(ReviewHorizontalCell.self, forCellWithReuseIdentifier: reviewHorizontalCellID)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviewResults?.feed.entry.count ?? .zero
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reviewHorizontalCellID, for: indexPath) as! ReviewHorizontalCell
        let reviewResult = reviewResults?.feed.entry[indexPath.item]
        
        cell.commentTitle.text = reviewResult?.title.label
        cell.authorName.text = reviewResult?.author.name.label
        cell.commentLabel.text = reviewResult?.content.label

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: view.frame.width, height: view.frame.height)
    }
}
